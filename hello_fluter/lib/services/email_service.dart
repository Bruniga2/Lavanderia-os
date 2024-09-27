import 'package:sendgrid_mailer/sendgrid_mailer.dart';

class EmailService {
  final String apiKey;
  late SendGrid sendGrid;

  // Constructor que inicializa SendGrid con la API Key proporcionada
  EmailService(this.apiKey) {
    sendGrid = SendGrid(apiKey);
  }

  // Método para enviar una notificación por correo electrónico
  Future<void> sendNotification(String to, String subject, String body) async {
    // Crea un nuevo correo electrónico
    final email = Email()
      ..from = Address('your-email@example.com') // Cambia esto por tu dirección de envío
      ..subject = subject
      ..text = body
      ..addRecipient(Address(to));

    try {
      // Envía el correo electrónico
      await sendGrid.send(email);
      print('Notification sent successfully');
    } catch (e) {
      // Manejo de errores
      print('Error sending notification: $e');
    }
  }
}
