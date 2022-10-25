/// id : "1"
/// pawari : "Pawari"
/// pawari_hinglish : "Pawari"
/// hindi : "Pawari"
/// hindi_hinglish : "Pawari"
/// english : "Pawari"
/// pawari_sentence : "Pawari"
/// hindi_sentence : "Pawari"
/// english_sentence : "Pawari"
/// word_type1 : "Pawari"
/// word_type2 : "Pawari"
/// word_type3 : "Pawari"
/// synonyms : null
/// antonyms : null
/// tags : null
/// details : "Pawari"
/// pronounciation : null
/// created_at : "2022-09-05\n10:43:00"
/// updated_at : "2022-09-05 10:43:00"

class WordsModel {
  WordsModel({
      String? id, 
      String? pawari, 
      String? pawariHinglish, 
      String? hindi, 
      String? hindiHinglish, 
      String? english, 
      String? pawariSentence, 
      String? hindiSentence, 
      String? englishSentence, 
      String? wordType1, 
      String? wordType2, 
      String? wordType3, 
      dynamic synonyms, 
      dynamic antonyms, 
      dynamic tags, 
      String? details, 
      dynamic pronounciation, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _pawari = pawari;
    _pawariHinglish = pawariHinglish;
    _hindi = hindi;
    _hindiHinglish = hindiHinglish;
    _english = english;
    _pawariSentence = pawariSentence;
    _hindiSentence = hindiSentence;
    _englishSentence = englishSentence;
    _wordType1 = wordType1;
    _wordType2 = wordType2;
    _wordType3 = wordType3;
    _synonyms = synonyms;
    _antonyms = antonyms;
    _tags = tags;
    _details = details;
    _pronounciation = pronounciation;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  WordsModel.fromJson(dynamic json) {
    _id = json['id'];
    _pawari = json['pawari'];
    _pawariHinglish = json['pawari_hinglish'];
    _hindi = json['hindi'];
    _hindiHinglish = json['hindi_hinglish'];
    _english = json['english'];
    _pawariSentence = json['pawari_sentence'];
    _hindiSentence = json['hindi_sentence'];
    _englishSentence = json['english_sentence'];
    _wordType1 = json['word_type1'];
    _wordType2 = json['word_type2'];
    _wordType3 = json['word_type3'];
    _synonyms = json['synonyms'];
    _antonyms = json['antonyms'];
    _tags = json['tags'];
    _details = json['details'];
    _pronounciation = json['pronounciation'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _pawari;
  String? _pawariHinglish;
  String? _hindi;
  String? _hindiHinglish;
  String? _english;
  String? _pawariSentence;
  String? _hindiSentence;
  String? _englishSentence;
  String? _wordType1;
  String? _wordType2;
  String? _wordType3;
  dynamic _synonyms;
  dynamic _antonyms;
  dynamic _tags;
  String? _details;
  dynamic _pronounciation;
  String? _createdAt;
  String? _updatedAt;
WordsModel copyWith({  String? id,
  String? pawari,
  String? pawariHinglish,
  String? hindi,
  String? hindiHinglish,
  String? english,
  String? pawariSentence,
  String? hindiSentence,
  String? englishSentence,
  String? wordType1,
  String? wordType2,
  String? wordType3,
  dynamic synonyms,
  dynamic antonyms,
  dynamic tags,
  String? details,
  dynamic pronounciation,
  String? createdAt,
  String? updatedAt,
}) => WordsModel(  id: id ?? _id,
  pawari: pawari ?? _pawari,
  pawariHinglish: pawariHinglish ?? _pawariHinglish,
  hindi: hindi ?? _hindi,
  hindiHinglish: hindiHinglish ?? _hindiHinglish,
  english: english ?? _english,
  pawariSentence: pawariSentence ?? _pawariSentence,
  hindiSentence: hindiSentence ?? _hindiSentence,
  englishSentence: englishSentence ?? _englishSentence,
  wordType1: wordType1 ?? _wordType1,
  wordType2: wordType2 ?? _wordType2,
  wordType3: wordType3 ?? _wordType3,
  synonyms: synonyms ?? _synonyms,
  antonyms: antonyms ?? _antonyms,
  tags: tags ?? _tags,
  details: details ?? _details,
  pronounciation: pronounciation ?? _pronounciation,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get pawari => _pawari;
  String? get pawariHinglish => _pawariHinglish;
  String? get hindi => _hindi;
  String? get hindiHinglish => _hindiHinglish;
  String? get english => _english;
  String? get pawariSentence => _pawariSentence;
  String? get hindiSentence => _hindiSentence;
  String? get englishSentence => _englishSentence;
  String? get wordType1 => _wordType1;
  String? get wordType2 => _wordType2;
  String? get wordType3 => _wordType3;
  dynamic get synonyms => _synonyms;
  dynamic get antonyms => _antonyms;
  dynamic get tags => _tags;
  String? get details => _details;
  dynamic get pronounciation => _pronounciation;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['pawari'] = _pawari;
    map['pawari_hinglish'] = _pawariHinglish;
    map['hindi'] = _hindi;
    map['hindi_hinglish'] = _hindiHinglish;
    map['english'] = _english;
    map['pawari_sentence'] = _pawariSentence;
    map['hindi_sentence'] = _hindiSentence;
    map['english_sentence'] = _englishSentence;
    map['word_type1'] = _wordType1;
    map['word_type2'] = _wordType2;
    map['word_type3'] = _wordType3;
    map['synonyms'] = _synonyms;
    map['antonyms'] = _antonyms;
    map['tags'] = _tags;
    map['details'] = _details;
    map['pronounciation'] = _pronounciation;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}