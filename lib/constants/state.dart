enum States {
  open('open'),
  inProgress('in_progress'),
  resolved('resolved'),
  closed('closed');

  const States(this.value);
  final String value;
}
