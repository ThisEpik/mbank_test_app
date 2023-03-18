// ANSI colors
// Black:   \x1B[30m
// Red:     \x1B[31m
// Green:   \x1B[32m
// Yellow:  \x1B[33m
// Blue:    \x1B[34m
// Magenta: \x1B[35m
// Cyan:    \x1B[36m
// White:   \x1B[37m
// Reset:   \x1B[0m

void printRed(Object? object) {
  print('\x1B[31m=====================================================\x1B[0m');
  print('\x1B[31m$object\x1B[0m');
}

void printGreen(Object? object) {
  print('\x1B[32m=====================================================\x1B[0m');
  print('\x1B[32m$object\x1B[0m');
}

void printYellow(Object? object) {
  print('\x1B[33m=====================================================\x1B[0m');
  print('\x1B[33m$object\x1B[0m');
}

void printMagenta(Object? object) {
  print('\x1B[35m=====================================================\x1B[0m');
  print('\x1B[35m$object\x1B[0m');
}

void printCyan(Object? object) {
  print('\x1B[36m=====================================================\x1B[0m');
  print('\x1B[36m$object\x1B[0m');
}
