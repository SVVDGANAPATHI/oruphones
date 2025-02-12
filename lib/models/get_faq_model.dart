import 'dart:convert';

GetFaqModel getFaqModelFromJson(String str) => GetFaqModel.fromJson(json.decode(str));

String getFaqModelToJson(GetFaqModel data) => json.encode(data.toJson());

class GetFaqModel {
  List<GetFaq> faQs;

  GetFaqModel({
    required this.faQs,
  });

  factory GetFaqModel.fromJson(Map<String, dynamic> json) => GetFaqModel(
        faQs: List<GetFaq>.from(json["FAQs"].map((x) => GetFaq.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "FAQs": List<dynamic>.from(faQs.map((x) => x.toJson())),
      };
}

class GetFaq {
  String id;
  String question;
  String answer;

  GetFaq({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory GetFaq.fromJson(Map<String, dynamic> json) => GetFaq(
        id: json["_id"],
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "question": question,
        "answer": answer,
      };
}
