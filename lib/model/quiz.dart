class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here

  list.add(Question(
    "Qual é o termo técnico para um ''plano estabelecido pelas superfícies incisais e oclusais dos dentes''?",
    [
      Answer("Posição Oclusal", false),
      Answer("Oclusão cêntrica", false),
      Answer("Plano Oclusal", true),
      Answer("Trauma Oclusal", false),
    ],
  ));

  list.add(Question(
    "O que significa o termo ''Fenômeno de Christensen''?",
    [
      Answer(
          "O espaço que ocorre entre as superfícies oclusais dos dentes posteriores",
          true),
      Answer(
          "Relação dos dentes anteriores que evita o contato dos dentes posteriores",
          false),
      Answer(
          "Curva anteroposterior que se estende da ponta do canino até as cúspides do último dente",
          false),
      Answer("Uma forma de proteção articular mútua", false),
    ],
  ));

  list.add(Question(
    "Complete a frase: ''Guia anterior'' é a relação dos dentes anteriores que evita...",
    [
      Answer(
          "o contato dentário que impeça as demais superfícies oclusais de realizarem contatos oclusais estáveis e harmônicos",
          false),
      Answer(
          "a curva anteroposterior que se estende da ponta do canino até as cúspides do último dente",
          false),
      Answer("o espaço que ocorre entre as superfícies oclusais", false),
      Answer(
          "o contato dos dentes posteriores em todos os movimentos mandibulares excêntricos",
          true),
    ],
  ));

  // list.add(Question(
  //   "Flutter user dart as a language?",
  //   [
  //     Answer("True", true),
  //     Answer("False", false),
  //   ],
  // ));

  return list;
}
