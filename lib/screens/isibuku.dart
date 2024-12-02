import 'package:flutter/material.dart';

class BookReaderPage extends StatelessWidget {
  final String bookTitle = "Harry Potter and the Sorceres Stone";
  final String bookContent = """
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non fermentum lectus. Duis pulvinar, lacus eu varius placerat, enim magna venenatis augue, sed pulvinar ligula arcu mattis mauris. Proin mollis, tortor at pretium tempor, ex diam tincidunt dui, quis venenatis sem dui id nunc. Praesent a euismod orci, a accumsan nulla. Phasellus id tellus id justo porta hendrerit. Maecenas non odio tincidunt, tempus nulla nec, auctor mauris. Quisque efficitur, lacus at molestie ultrices, eros purus ultricies neque, et tristique odio metus vulputate sem. Vivamus id finibus tellus, id malesuada eros. Curabitur a semper dolor. Aenean a consequat est. Donec mattis vulputate sapien. In fringilla gravida placerat. Pellentesque rutrum nunc fringilla ultricies scelerisque. Suspendisse non fringilla quam. Vivamus sit amet justo urna. Praesent neque libero, ullamcorper sit amet orci vel, euismod dapibus orci.

Donec sagittis risus urna, ut tristique velit accumsan vitae. Praesent scelerisque nibh auctor ligula molestie, eget aliquet sem malesuada. Vestibulum lorem lorem, ultrices quis efficitur id, facilisis at dui. Sed ultrices mattis magna, sed viverra leo. In ac vulputate elit, nec eleifend turpis. Morbi maximus mauris non lectus ullamcorper, sit amet luctus velit tincidunt. Pellentesque vel odio imperdiet odio lacinia fermentum vitae nec arcu. Sed ultricies dui erat. Pellentesque porttitor elit vel magna mattis, in euismod enim condimentum. Duis arcu urna, fringilla eu ante vitae, pulvinar blandit turpis. Morbi et tincidunt ligula. Nulla et sollicitudin est. Integer aliquam rhoncus nunc. Maecenas arcu lacus, tincidunt sed dignissim ut, rhoncus quis enim. Cras dictum pretium lobortis. Mauris leo dolor, sollicitudin sed dolor et, consequat congue neque.

Ut aliquam fringilla mauris, et molestie leo pretium id. Phasellus commodo quis dui sit amet hendrerit. Cras fringilla scelerisque ipsum. Pellentesque iaculis nulla nec aliquet viverra. Nullam in diam eleifend, condimentum ligula quis, bibendum felis. Quisque semper ex a dui luctus dignissim. Curabitur sit amet lacinia nibh. Sed pharetra tempus ante, ac varius enim dignissim at. Aliquam mi dui, suscipit sed consequat ut, suscipit quis augue. In mi odio, suscipit vel lorem in, mollis mattis est.

Suspendisse sagittis dictum placerat. Ut feugiat nec nibh blandit mollis. Quisque egestas, eros sed efficitur tempor, leo dui tristique nunc, et molestie nulla neque id ligula. Aenean vulputate tempor nibh. Nulla in risus enim. Vestibulum iaculis diam et purus vulputate venenatis. Fusce ac enim gravida, facilisis ipsum nec, commodo risus. Nunc quis semper neque, ac scelerisque turpis. Ut gravida aliquam sem eget dictum.

Ut elementum, nibh vel euismod convallis, ipsum eros ornare nisl, at varius justo lectus volutpat dolor. Morbi mattis consectetur ligula. Quisque a nisi vitae diam tristique iaculis sed quis dolor. Duis nec nisi enim. Duis mattis luctus scelerisque. Ut quis condimentum nunc. Maecenas tempus magna sit amet mauris bibendum, sit amet pellentesque enim tempus.

Integer porttitor sem felis, nec auctor ligula varius eget. Pellentesque tristique iaculis ex sit amet pretium. Mauris congue nisl nulla, nec convallis erat cursus in. Vestibulum pulvinar elit a nisl pretium pellentesque. Fusce eu tempus justo. Aenean id vestibulum erat. Nunc et nunc sed lacus aliquet varius.

Proin lacus mi, venenatis id feugiat in, tincidunt varius elit. In pharetra elit vitae lacus dignissim, aliquet porttitor mauris tincidunt. Nullam dapibus tincidunt arcu non dignissim. Fusce consequat laoreet odio nec faucibus. Nullam ut efficitur purus. Nam vel neque neque. Vivamus quis euismod quam, sit amet pulvinar augue. Duis eget hendrerit dui, vehicula sollicitudin dui. Maecenas fermentum volutpat dictum. Quisque dictum varius dui aliquet placerat. Nam hendrerit, eros viverra ullamcorper vehicula, tortor erat vulputate ante, quis congue lacus mauris sed tellus. Nulla sed scelerisque turpis. Quisque at sem elementum, commodo lacus eu, gravida erat.

Duis semper, tellus vel congue interdum, mauris turpis lobortis lorem, at cursus risus ex nec nibh. Cras eget eros at turpis rhoncus luctus. Morbi ultrices, elit a faucibus mattis, sem felis mollis tortor, vel tempor risus nunc non nisi. Etiam orci arcu, mollis nec nisi sed, finibus pellentesque magna. Nunc varius diam et sapien rhoncus, eu pharetra libero semper. Aenean cursus, mauris sit amet eleifend porttitor, est sapien interdum ante, non vestibulum odio mauris finibus ipsum. Sed scelerisque quam ac accumsan euismod. Curabitur at urna convallis, iaculis arcu at, laoreet dolor. Morbi elementum in lacus a luctus. Proin quis semper metus. Nunc in purus scelerisque, elementum sem at, ornare ipsum.

Donec hendrerit mauris et nunc pulvinar, ac tristique leo molestie. Praesent quis quam non erat laoreet pharetra quis eget ex. Praesent at felis in nibh semper condimentum. Integer eu ante mauris. Pellentesque gravida, sem non pretium interdum, tortor eros aliquet sem, eu cursus diam velit quis leo. Nulla dui lectus, molestie ac purus quis, accumsan tincidunt lectus. Donec turpis quam, lobortis at ipsum in, tempor mattis ipsum. Donec nec mi dui. Morbi quis feugiat urna. Mauris facilisis massa sit amet congue accumsan. Nulla id augue vitae turpis posuere vehicula id in felis. Duis nunc ipsum, condimentum et mauris ut, elementum pellentesque libero. Cras ornare, odio sed convallis commodo, dui ligula faucibus tortor, nec lacinia nibh magna id eros. Aenean tempor fermentum sapien, eu auctor augue facilisis scelerisque.

Donec efficitur consectetur commodo. Curabitur tristique ornare ante in dictum. Duis ut convallis odio, sed bibendum tortor. Phasellus molestie sit amet velit sit amet accumsan. Quisque in aliquam tellus. Praesent id velit eu lorem convallis efficitur eleifend sit amet diam. Fusce nec urna ac enim porttitor euismod id a felis. Integer tincidunt risus non massa rhoncus, eget facilisis felis eleifend. Donec quis velit eu elit venenatis tempor ut vitae tortor. Morbi a cursus metus. Integer convallis maximus ante et tempus. Etiam feugiat dui sem, id convallis arcu sagittis ac. Vivamus nisi enim, euismod sed pharetra quis, sodales a quam. Sed non gravida turpis, eget semper quam.

Nullam est risus, volutpat auctor gravida ut, blandit sed lectus. Nulla suscipit erat sed dolor fermentum mollis. Maecenas fermentum diam quis dui pharetra bibendum. Fusce felis tortor, mollis at eros efficitur, sagittis auctor justo. Vestibulum sed nisi sed ligula dignissim ullamcorper. Etiam iaculis sit amet augue nec blandit. Duis et diam eget mauris finibus hendrerit. In pharetra malesuada libero, et pretium nunc semper ut. Quisque ac molestie lacus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras egestas facilisis nunc quis sodales. Sed mauris neque, accumsan ut nisi id, sagittis viverra lorem. Suspendisse sed fringilla odio. Maecenas consectetur in libero ut faucibus. Aenean nec elementum augue.

Ut interdum augue sem. Proin porta aliquam nisi vitae convallis. Sed tempus ante cursus pretium porta. Sed dignissim massa arcu, aliquet interdum sem porttitor in. Donec hendrerit accumsan semper. Nam faucibus sit amet tortor a fermentum. Nunc lacus diam, suscipit hendrerit purus sollicitudin, vehicula feugiat tellus. Aenean nec augue sed risus semper fringilla id vel lacus. Quisque mi velit, ultrices sodales tempor vitae, elementum vitae nunc. Suspendisse quam erat, sodales non urna eget, luctus tincidunt massa. Fusce pretium, tellus congue pharetra sagittis, odio purus dignissim urna, non hendrerit lorem ante non elit. Morbi nec bibendum augue. Integer placerat vehicula libero sed vulputate.

Aenean gravida nisl at malesuada volutpat. Maecenas auctor urna et ligula consectetur convallis. Maecenas sodales mi a neque pulvinar, vitae placerat ipsum aliquam. Cras sit amet massa elementum, egestas lorem id, ultrices odio. Cras vitae sapien sed nisi placerat iaculis et at lectus. Vestibulum commodo tortor a justo commodo facilisis. Proin tempus ex ac lacus tempor vehicula. Integer laoreet pulvinar finibus. Mauris pellentesque risus et condimentum iaculis. Sed congue odio ac velit efficitur, et ultricies turpis dignissim. Sed accumsan, dolor condimentum porttitor placerat, massa enim blandit lorem, non dignissim odio ligula eget odio. Nam ultricies non velit vitae commodo. Mauris vitae molestie leo. Duis fermentum vehicula sapien, eget euismod leo facilisis in.

Curabitur porta posuere urna, ac auctor enim porttitor quis. Curabitur a lacus velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer in varius erat. Curabitur nec nunc eget justo cursus tempor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas laoreet magna dolor, vitae hendrerit erat condimentum a. Nulla efficitur erat ac mollis eleifend. Etiam quis nulla at orci pharetra sagittis. Fusce cursus, risus ac congue sodales, odio diam tincidunt turpis, ac commodo neque mi a lectus. Maecenas placerat lacus sapien, non gravida elit finibus at. Nam dui eros, tincidunt tristique lacinia ac, placerat non libero. Integer vel tincidunt odio, porta semper velit.

Donec porttitor nisi at mauris bibendum, nec rutrum augue venenatis. Pellentesque ut turpis non nibh convallis efficitur. Aenean quis felis vitae felis dignissim accumsan vel a ipsum. Aenean at posuere nisi, et feugiat ipsum. Aliquam porta mi eget nibh placerat, at interdum metus eleifend. Vivamus lacinia aliquam augue, at lacinia elit rhoncus quis. Sed sit amet ex elit. Phasellus vel elementum metus. Quisque venenatis vitae justo ut rutrum.

Proin tincidunt velit nec congue accumsan. Duis bibendum, leo sed rutrum ullamcorper, arcu magna interdum nunc, id lacinia ligula lorem ut ante. Maecenas vehicula et lacus ac sagittis. Etiam condimentum nisl sed viverra accumsan. Vivamus iaculis sed magna in interdum. Aenean in aliquet tortor. Suspendisse sit amet lacus egestas, congue magna eu, vulputate enim. Pellentesque consectetur ligula consequat arcu sagittis feugiat. Morbi nibh est, fermentum et tellus posuere, dictum ultricies magna.

Cras mollis ultrices neque at feugiat. Cras eleifend ut odio sit amet placerat. Ut laoreet scelerisque vehicula. Nunc feugiat urna urna, ac rutrum erat scelerisque ac. Nulla non libero a turpis mattis scelerisque. Integer blandit lorem nec vestibulum euismod. Nullam non rhoncus dolor. Fusce finibus placerat risus, eget aliquam mi maximus vestibulum. Cras eu augue et tellus gravida facilisis. Donec rutrum dui non lectus ornare accumsan. Vivamus molestie finibus nisi, eu mollis dui semper et. Ut tempus tellus vel dui gravida, et finibus dolor molestie. Nunc scelerisque est lectus, id malesuada nunc maximus hendrerit. Vestibulum tempor sem sed erat placerat molestie.

Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aliquam condimentum lacinia quam, eget dictum nunc viverra a. Nulla scelerisque odio augue, sit amet eleifend ligula pulvinar non. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nullam ut tincidunt tellus. Nulla facilisi. Donec commodo enim id ipsum eleifend porttitor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus varius rutrum erat consequat tempus. Sed commodo nulla maximus, tincidunt ante ac, pharetra enim. In et risus at neque eleifend laoreet. Nunc ac urna ultrices, viverra leo eget, commodo leo. Duis a leo at libero ultricies laoreet eget in nunc. Maecenas lobortis tortor erat, non aliquet velit fringilla quis.

Etiam hendrerit mollis ornare. Aliquam arcu ipsum, mollis quis massa sed, viverra elementum ligula. Maecenas ipsum lacus, pellentesque ac urna dignissim, volutpat laoreet risus. Mauris vitae nunc dictum, tincidunt ante vel, aliquam erat. Nunc semper suscipit mollis. Sed mollis tincidunt sem a iaculis. Vestibulum tempor feugiat enim sit amet porttitor. In erat nisi, blandit ac volutpat vitae, vestibulum nec tortor. In ut pulvinar nibh, posuere semper est. Pellentesque quis ligula mi. Nulla facilisi. Phasellus porta viverra massa.

Nullam vulputate nibh euismod iaculis faucibus. Suspendisse vitae velit odio. Maecenas fringilla sagittis quam egestas scelerisque. Aliquam sollicitudin interdum massa eu egestas. Duis sit amet ligula et metus vestibulum vehicula eget eu diam. Vestibulum odio lacus, semper non dui in, luctus suscipit neque. Suspendisse quis enim ac felis condimentum lacinia. Proin eget fermentum sapien, id iaculis urna. Maecenas odio leo, luctus sed congue lacinia, faucibus nec sem.

Curabitur mollis, felis eu tempor gravida, nisi velit venenatis lorem, nec porttitor sem neque nec nibh. Vestibulum id porttitor mi. Duis non tortor id tortor pretium euismod. Aliquam ullamcorper luctus ligula, vitae sollicitudin lacus vulputate id. Vivamus vulputate est sapien. Sed a mauris nec orci malesuada imperdiet sed vel mi. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Ut id risus in nisl cursus tempus condimentum nec nunc. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus et sapien id ligula dapibus lacinia. Praesent vel leo efficitur, semper felis vel, placerat augue. Proin non commodo ex. Donec mi ex, tristique quis tortor a, dapibus varius lacus. Vestibulum vitae nisi maximus, lacinia.  
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          bookTitle,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Konten Buku
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange[50],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  bookContent,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(height: 20),
              // Tombol Kembali
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Kembali',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
