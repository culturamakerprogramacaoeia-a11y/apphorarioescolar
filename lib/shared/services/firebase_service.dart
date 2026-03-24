import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/usuario.dart';
import '../models/aula.dart';

class FirebaseService extends ChangeNotifier {
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  FirebaseFirestore get _db => FirebaseFirestore.instance;
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  Usuario? _currentUsuario;
  Usuario? get currentUsuario => _currentUsuario;

  Future<void> init() async {
    if (_isInitialized) return;
    _isInitialized = true;
    notifyListeners();
  }

  Future<Usuario?> login(String codigo, String senha) async {
    try {
      final snapshot = await _db
          .collection('usuarios')
          .where('codigo', isEqualTo: codigo)
          .where('senha', isEqualTo: senha)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final data = snapshot.docs.first.data();
        _currentUsuario = Usuario.fromMap(data);
        notifyListeners();
        
        // Local cache
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('currentUser', jsonEncode(data));
        
        return _currentUsuario;
      }
    } catch (e) {
      debugPrint('Login Error: $e');
    }
    return null;
  }

  Future<void> logout() async {
    _currentUsuario = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('currentUser');
    notifyListeners();
  }

  // Real-time synchronization for many tables (simplified for v2)
  Stream<List<Aula>> getAulasStream(String turma) {
    return _db
        .collection('aulas')
        .where('turma', isEqualTo: turma)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Aula.fromMap(doc.data())).toList());
  }

  // Additional modern methods for v2 SaaS
  Future<void> updateProfilePhoto(String url) async {
    if (_currentUsuario == null) return;
    await _db.collection('usuarios').doc(_currentUsuario!.id.toString()).update({'fotoUrl': url});
    _currentUsuario!.fotoUrl = url;
    notifyListeners();
  }
}
