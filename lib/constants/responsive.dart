/// Responsive helper — Mobile only (không dùng cho Tablet/Desktop).
///
/// Breakpoints:
///   < 300px  → Tiny   : GridView 2 cột ở TaskSection
///   < 360px  → Small  : font/padding thu gọn
///   ≥ 360px  → Normal : layout mặc định
class Responsive {
  Responsive._(); // không cho khởi tạo

  // ── Breakpoint checks ──────────────────────────────────────────────────────

  /// < 300px: chuyển ListView → GridView 2 cột
  static bool isTiny(double width) => width < 300;

  /// < 360px: font và padding nhỏ hơn bình thường
  static bool isSmall(double width) => width < 360;

  // ── Spacing ────────────────────────────────────────────────────────────────

  /// Padding ngang/dọc chính (page-level)
  static double padding(double width) {
    if (isTiny(width)) return 8.0;
    if (isSmall(width)) return 10.0;
    return 16.0;
  }

  /// Khoảng cách ngang nhỏ giữa các phần tử
  static double gap(double width) {
    if (isSmall(width)) return 8.0;
    return 12.0;
  }

  // ── Typography ─────────────────────────────────────────────────────────────

  /// Font size tiêu đề lớn (tên người dùng, section title)
  static double titleFontSize(double width) {
    if (isSmall(width)) return 15.0;
    return 18.0;
  }

  /// Font size nội dung (item title)
  static double bodyFontSize(double width) {
    if (isSmall(width)) return 13.0;
    return 15.0;
  }

  /// Font size phụ (username, label, meta)
  static double captionFontSize(double width) {
    if (isSmall(width)) return 11.0;
    return 12.0;
  }

  // ── Components ─────────────────────────────────────────────────────────────

  /// Bán kính CircleAvatar
  static double avatarRadius(double width) {
    if (isSmall(width)) return 28.0;
    return 36.0;
  }

  /// Kích thước icon trạng thái task
  static double stateIconSize(double width) {
    if (isTiny(width)) return 18.0;
    if (isSmall(width)) return 20.0;
    return 24.0;
  }
}
