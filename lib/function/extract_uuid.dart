String extractUUID(String qrData) {
  // Split the string by '--'
  List<String> parts = qrData.split('--');

  // The UUID should be the last part of the split
  return parts.last;
}