part of 'package:effective_error_handling/src/features/home/presentation/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(16),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Expanded(
                child: BlocBuilder<BlocArchetypes, ArchetypesState>(
                  builder: (BuildContext context, ArchetypesState state) {
                    final List<Archetype> listArchetype =
                        state.model.listArchetype ?? <Archetype>[];

                    if (state is ErrorGetArchetypeState) {
                      return const Center(
                        child: Icon(
                          Icons.flutter_dash_outlined,
                          size: 200,
                          color: Colors.red,
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: listArchetype.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Archetype item = listArchetype[index];
                        return MyCard(
                          data: item,
                          onTapDelete: () {},
                          onTap: () async {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  S.current.detailArchetype(
                                    item.archetypeName,
                                  ),
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
