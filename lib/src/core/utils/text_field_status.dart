enum TextFieldStatus { initial, success, failure }

extension TextFieldStatusX on TextFieldStatus {
  bool get isInitial => this == TextFieldStatus.initial;
  bool get isSuccess => this == TextFieldStatus.success;
  bool get isFailure => this == TextFieldStatus.failure;
}
