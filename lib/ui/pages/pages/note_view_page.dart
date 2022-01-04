part of 'pages.dart';

class NoteViewScreen extends StatefulWidget {
  static const route = "/note-view";
  @override
  _NoteViewScreenState createState() => _NoteViewScreenState();
}

class _NoteViewScreenState extends State {
  Note selectedNote;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final id = ModalRoute.of(this.context).settings.arguments;

    final provider = Provider.of<NoteProvider>(this.context);

    if (provider.getNote(id) != null) {
      selectedNote = provider.getNote(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0.7,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.black,
            ),
            onPressed: () => _showDialog(),
          ),
          BlocBuilder<UserBloc, UserState>(builder: (_, userState) {
            if (userState is UserLoaded) {
              if (imageFileToUpload != null) {
                uploadImage(imageFileToUpload).then((downloadURL) {
                  imageFileToUpload = null;
                  context
                      .bloc<UserBloc>()
                      .add(UpdateData(profileImage: downloadURL));
                });
              }
              return IconButton(
                icon: Icon(
                  Icons.file_copy_rounded,
                  color: Colors.black,
                ),
                onPressed: () async {
                  final pdfFile = await PdfApi.generateCenteredText(
                      selectedNote.title,
                      userState.user.name,
                      selectedNote.date,
                      selectedNote.content);
                  PdfApi.openFile(pdfFile);
                },
              );
            }
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                selectedNote?.title,
                style: viewTitleStyle,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.access_time,
                    size: 18,
                  ),
                ),
                Text('${selectedNote?.date}')
              ],
            ),
            if (selectedNote.imagePath != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.file(File(selectedNote.imagePath)),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                selectedNote.content,
                style: viewContentStyle,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: mainColor,
            onPressed: () {
              Navigator.pushNamed(context, NoteEditScreen.route,
                  arguments: selectedNote.id);
            },
            child: Icon(Icons.edit),
          ),
          SizedBox(height: 33)
        ],
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: this.context,
        builder: (context) {
          return DeletePopUp(selectedNote: selectedNote);
        });
  }
}
