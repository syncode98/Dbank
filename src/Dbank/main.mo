import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor Dbank{
  stable var currentValue :Float = 300;

  stable var startTime = Time.now();
  startTime:=Time.now();
  currentValue:=300;
  let id = 10;
  public func topUp(amount: Float){
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };
  
  public func withDraw(amount: Float){
    let returnValue:Float = currentValue - amount;
    if(returnValue>=0){
      currentValue-=amount;
      Debug.print(debug_show(returnValue));
    }
    else{
      Debug.print("Not valid")
    }
  };

  public query func checkBalance():async Float{
    return currentValue;
  };
  public func compound(){
    let currentTime = Time.now();
    //Convert nanoseconds to seconds
    let timeElapsed = (currentTime - startTime)/(1000000000);
    currentValue:=currentValue*(1.01)**Float.fromInt(timeElapsed);



  }

}