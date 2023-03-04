//convert DateTime object to a String yyymmmddd
String convertDateTimeToString(DateTime dateTime) {
  //year in the format -> yyy
  String year = dateTime.year.toString();

  //month in the format -> mmm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = "0$month";
  }

  //year in the format -> yyy
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = "0$day";
  }

//final format -> yyymmmddd

  String yyymmmddd = year + month + day;
  return yyymmmddd;
}
