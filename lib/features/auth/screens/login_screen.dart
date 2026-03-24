import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/glass_card.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _codigoController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _isLoading = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Dynamic Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark 
                    ? [const Color(0xFF0F172A), const Color(0xFF1E1B4B)]
                    : [const Color(0xFFEEF2FF), const Color(0xFFE0E7FF)],
              ),
            ),
          ),
          
          // Animated Mesh Blobs (Visual Flare)
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.15),
              ),
            ).animate(onPlay: (controller) => controller.repeat())
             .scale(duration: 4.seconds, curve: Curves.easeInOut)
             .move(begin: const Offset(0, 0), end: const Offset(20, 20)),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: GlassCard(
                  blur: 20,
                  opacity: isDark ? 0.05 : 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // App Logo / Symbol
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryGradient,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.3),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: const Icon(
                              LucideIcons.graduationCap,
                              size: 48,
                              color: Colors.white,
                            ),
                          ).animate().scale(duration: 600.ms, curve: Curves.backOut),
                          
                          const SizedBox(height: 32),
                          const Text(
                            'Mestre da Escola',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -1,
                            ),
                          ).animate().fadeIn(delay: 200.ms).moveY(begin: 10, end: 0),
                          
                          const SizedBox(height: 8),
                          Text(
                            'Sua jornada de aprendizado começa aqui',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 16,
                            ),
                          ).animate().fadeIn(delay: 400.ms),
                          
                          const SizedBox(height: 48),
                          
                          // Input Fields
                          _buildTextField(
                            controller: _codigoController,
                            label: 'Código de Acesso',
                            icon: LucideIcons.user,
                            hint: 'Digite seu código escolar',
                          ).animate().fadeIn(delay: 600.ms).slideX(begin: -0.1, end: 0),
                          
                          const SizedBox(height: 20),
                          
                          _buildTextField(
                            controller: _senhaController,
                            label: 'Senha',
                            icon: LucideIcons.lock,
                            hint: 'Sua senha segura',
                            isPassword: true,
                          ).animate().fadeIn(delay: 800.ms).slideX(begin: -0.1, end: 0),
                          
                          const SizedBox(height: 40),
                          
                          // Login Button
                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: _isLoading 
                                ? const CircularProgressIndicator(color: Colors.white)
                                : const Text(
                                    'Entrar na Plataforma',
                                    style: TextStyle(
                                      fontSize: 18, 
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            ).animate().shimmer(delay: 2.seconds, duration: 2.seconds),
                          ).animate().fadeIn(delay: 1.seconds).scale(),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hint,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        TextFormField(
          controller: controller,
          obscureText: isPassword && _obscureText,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: AppColors.primary, size: 20),
            suffixIcon: isPassword ? IconButton(
              icon: Icon(_obscureText ? LucideIcons.eyeOff : LucideIcons.eye, size: 20),
              onPressed: () => setState(() => _obscureText = !_obscureText),
            ) : null,
            filled: true,
            fillColor: Theme.of(context).brightness == Brightness.dark 
                ? Colors.white.withOpacity(0.05) 
                : Colors.black.withOpacity(0.03),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
