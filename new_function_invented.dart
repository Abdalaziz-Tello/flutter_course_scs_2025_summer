

int calculateNumbersResult(int firstNumber,int secondNumber){
return firstNumber+secondNumber;
}


int calculateNumbersResultWithOverRide({required int firstNumber,required int secondNumber,int thirdNumber=0}){
return firstNumber+secondNumber+thirdNumber;
}

var myNewSolutionForImplFunction = (int a,int b)=>a+b;