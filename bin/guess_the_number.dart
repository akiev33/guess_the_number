import 'dart:io';

import 'package:guess_the_number/guess_the_number.dart' as guess_the_number;
import 'dart:math';

void main() {
  print(
      'Выберите режим игры: \n1) Человек отгадывает число \n2) Компьютер отгадывает число');
  int choice = int.parse(stdin.readLineSync()!);
  if (choice == 1) {
    random_computer();
  } else if (choice == 2) {
    random_user();
  }
}

void random_computer() {
  var rng = Random();
  // random от 1 до 10
  int random_number = rng.nextInt(100) + 1;
  int i = 0;
  // счетчик
  int count = 1;
  bool is_active_game = true;

  print('Я загадал число от 1 до 100');
  
  do {
    int user_input = int.tryParse(stdin.readLineSync()!) ?? 105;
    if (user_input > 0 && user_input <= 100) {
      if (user_input == random_number) {
        print('Молодец, ты угадал! Кол-во попыток $count');
        is_active_game = false;
      } else if (random_number > user_input) {
        print('Число больше $user_input');
        count++;
      } else if (random_number < user_input) {
        print('Число меньше $user_input');
        count++;
      }
    } else if (user_input == 105) {
      print('Ошибка!');
      is_active_game = false;
    } else {
      print('Вводи от 1 до 100');
    }
  } while (is_active_game);
}

// среднее кол-во попыток для отгадывания числа 6
void random_user() {
  int i = 0;
  int t1 = 1;
  int t2 = 100;
  int count = 1;
  bool is_active_game = true;

  do {
    int x = (t1 + t2) ~/ 2;
    print(
        'Твое число больше, меньше или равно $x ? \n1 - Больше  2 - Меньше  3 - Равно');
    int choice = int.tryParse(stdin.readLineSync()!) ?? 105;
    if (choice == 3) {
      print('Я угадал. Спасибо за игру! Кол-во моих попыток $count');
      is_active_game = false;
    } else if (choice == 1) {
      t1 = x;
      count++;
    } else if (choice == 2) {
      t2 = x;
      count++;
    } else if (choice == 105) {
      print('Пиши 1, 2 или 3');
    } else if (choice <= 0 || choice > 3) {
      print('Ошибка, у тебя тока 3 выбора (1, 2, 3)');
    }
  } while (is_active_game);
}
