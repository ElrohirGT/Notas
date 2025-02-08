#include <stdio.h>
#include <unistd.h>

int main(int argc, char **argv) {
  int id = fork();

  if (id != 0) {
    fork();
  }

  printf("Hola Sistos 2025\n");
}
