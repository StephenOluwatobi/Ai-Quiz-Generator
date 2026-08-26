#include "my_application.h"

// Creates the Linux app and hands control to GTK's event loop.
int main(int argc, char** argv) {
  g_autoptr(MyApplication) app = my_application_new();
  return g_application_run(G_APPLICATION(app), argc, argv);
}
