import 'dart:io';

import 'package:guess_the_number/guess_the_number.dart' as guess_the_number;
import 'dart:math';

void main() {
  random_computer();
  random_user();
}

void random_computer() {
  var rng = Random();
  // random от 1 до 10
  int random_number = rng.nextInt(10) + 1;
  int i = 0;
  // счетчик 
  int count = 0;
  while (i <= random_number) {
    print('Я загадал число от 1 до 10');
    int user_input = int.tryParse(stdin.readLineSync()!) ?? 105;
    count += 1;
    if (user_input == random_number) {
      print('Молодец, ты угадал! Кол-во попыток $count');
      break;
    } else if (random_number > user_input) {
      print('Число больше $user_input');
    } else if (random_number < user_input) {
      print('Число меньше $user_input');
    } else if (user_input == 105) {
      print('Вводи только числа!');
    }
  }
}


// среднее кол-во попыток для отгадывания числа 3
void random_user() {
  int i = 0;
  int t1 = 1;
  int t2 = 10;
  int count = 0;
  while (i <= 11) {
    count += 1;
    // общая длинна делиться попалам, так остнется меньше вариантов 
    int x = (t1 + t2) ~/ 2;
    print(
        'Твое число больше, меньше или равно $x ? \n1 - Больше  2 - Меньше  3 - Равно');
    int choice = int.parse(stdin.readLineSync()!);
    if (choice == 3) {
      print('Я угадал. Спасибо за игру! Кол-во моих попыток $count');
      break;
    } else if (choice == 1) {
      t1 = x;
    } else if (choice == 2) {
      t2 = x;
    }
  }
}
