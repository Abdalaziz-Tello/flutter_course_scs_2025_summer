import 'fake_data.dart';
import 'new_function_invented.dart';

void main() {
  // num counter = 20;
  // print(counter.runtimeType);
  // num degree = 20.4;
  // print(degree.runtimeType);

  // bool? isFavorite;
  // isFavorite as bool;
  // try {
  //   if (isFavorite) {
  //     print("Yes this product is my Favorite");
  //   } else {
  //     print("No this product is not my Favorite");
  //   }
  // } catch (e) {
  //   print(e);
  // }

  // num simlpeNumber = 20;
  // try {
  //   simlpeNumber as int;
  //   if (simlpeNumber is int) {
  //     print("Yes this product is my Favorite");
  //   } else {
  //     print("No this product is not my Favorite");
  //   }
  // } catch (e) {
  //   print(e);
  // }

  // print("object");

  List<int> numbers = [1, 2, 3, 4, -2, 0];

  print(numbers[4]);

  Map<String, List<int>> marks = {
    "Ahmad": [20, 30, 59, 59, 80],
    "Yaser": [40, 40, 59, 58, 80],
  };
  print(marks["Yaser"]![3]);
  print(marks.keys.elementAt(1));

  // print(
  //   result == 0
  //       ? "0"
  //       : result > 1
  //       ? "1"
  //       : "-1",
  // );

  // if (result > 0) {
  //   print("1");
  // } else if (result < 0) {
  //   print("-1");
  // } else {
  //   print("0");
  // }

  // bool? status = result > 0;
  // switch (status) {
  //   case true:
  //     print("1");
  //   case false:
  //     print("-1");

  //   default:
  //     print("0");
  // }
  int results = calculateResult(numbers);
  printTheOutput(results);

  dynamic stupidResult = stupidExample(8);
  print(stupidResult);


  print(fakeData[0]["address"]["geo"]["lat"]);// ? Accepted
  print(fakeData[0].values.elementAt(4).values.elementAt(4)['lat']);// ? Accepted

  print(fakeData[0].values.elementAt(4).values.elementAt(4).values.elementAt(0));// ? Accepted

  print(calculateNumbersResult(20, 20));
  print(calculateNumbersResultWithOverRide(secondNumber: 30,firstNumber: 20));
  print(myNewSolutionForImplFunction(30,50));
}

int calculateResult(List<int> numbers) {
  int result = 1;
  for (var i = 0; i < numbers.length; i++) {
    result = result * numbers[i];
  }
  return result;
}

void printTheOutput(int result) {
  if (result > 0) {
    print("1");
  } else if (result < 0) {
    print("-1");
  } else {
    print("0");
  }
}

int? stupidExample(int stupidNumber) {
  if (stupidNumber > 10) {
    return 30;
  } else {
    // ? Auto Return If the function has types as Dynamic
    return null;
  }
}



