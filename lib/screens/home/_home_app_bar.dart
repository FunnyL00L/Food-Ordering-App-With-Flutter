part of 'home_screen.dart';


class _HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const _HomeAppBar();

  @override
  State<_HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(128.0);
}

class _HomeAppBarState extends State<_HomeAppBar> {
  int selectedTable = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      toolbarHeight: 80.0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Deliver now',
            style: textTheme.bodyLarge,
          ),
          InkWell(
            onTap: () => _showTableDrawer(context),
            child: Row(
              children: [
                Text(
                  'Meja $selectedTable',
                  style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.expand_more,
                  color: colorScheme.onSurface,
                ),
              ],
            ),
          ),
        ],
      ),
actions: [
  IconButton(
    icon: const Icon(Icons.account_circle, size: 30),
    onPressed: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    },
  ),
  const SizedBox(width: 8.0),
],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0).copyWith(
            bottom: 4.0,
          ),
          child: TextFormField(
            onTap: () {},
            decoration: InputDecoration(
              hintText: 'Search for restaurants, dishes...',
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showTableDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.5,
            ),
            itemCount: 16,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedTable = index;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: selectedTable == index ? Colors.blue : Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Meja $index',
                      style: TextStyle(
                        color: selectedTable == index ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}