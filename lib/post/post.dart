class Post{
  final String _userEmail;
  final String _userText;
  final DateTime _dateCreated;
  final DateTime _dueDate;
  final int _numOfLikes;
  final int _numofRetweets;
  final int _address;
  final String _picture;
  final int _ticketPrice;

  Post(this._userEmail, this._userText, this._dueDate,
       this._address, this._picture, this._ticketPrice)
      :  _numofRetweets = 0,
         _dateCreated =  DateTime.now(),
         _numOfLikes = 0;
}