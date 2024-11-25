// 1. NotificationService 인터페이스 설계
abstract class NotificationService {
  void sendNotification(String message);
}

// 2. 인터페이스 구현
class EmailNotificationService implements NotificationService {
  @override
  void sendNotification(String message) {
    print('Email Notification: $message');
  }

}

class SMSNotificationService implements NotificationService {
  @override
  void sendNotification(String message) {
    print('SMS Notification: $message');
  }

}

// 3. 유스케이스에서 인터페이스 사용
class NotificationManager {
  final NotificationService notificationService;

  NotificationManager(this.notificationService);

  void send(String message) {
    notificationService.sendNotification(message);
  }
}

// 4. 테스트
void main() {
  // Email 알림 테스트
  final emailService = EmailNotificationService();
  final emailManager = NotificationManager(emailService);
  emailManager.send('Hello via Email!');

  // SMS 알림 테스트
  final smsService = SMSNotificationService();
  final smsManager = NotificationManager(smsService);
  smsManager.send('Hello via SMS!');
}
