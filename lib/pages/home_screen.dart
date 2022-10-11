import 'package:flutter/material.dart';
import 'package:flutter_application_te_veo_profe/provider/home_provider.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../models/home.dart';
import '../models/justificacion.dart';
import '../models/profesor.dart';
import '../provider/justificacion_provider.dart';
import '../provider/profesor_provider.dart';
import '../provider/home_provider.dart';
import '../widgets/menu_lateral.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //HOME
    final homeProvider = Provider.of<HomeProvider>(context);
    final List<Home> listaHome = homeProvider.listaHome;

    //PROFESOR
    final profesorProvider = Provider.of<ProfesorProvider>(context);
    final List<Profesor> listaProfesor = profesorProvider.listaProfesor;

    //JUSTIFICACION
    final justificacionProvider = Provider.of<JustificacionProvider>(context);
    final List<Justificacion> listaJustificacion =
        justificacionProvider.listaJustificacion;

    return Scaffold(
      drawer: MenuLateral(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Column(
                children: [
                  Text(
                    "COLEGIO".toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: kActiveColor),
                  ),
                  Text(
                    "San Francisco",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            sliver: SliverToBoxAdapter(
              child: ImageCarousel(listaHome: listaHome),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: SectionTitle(
                title: "Profesores",
                press: () {},
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                listaProfesor.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: defaultPadding),
                  child: ProfesorInfo(
                    curso: listaProfesor[index].curso,
                    imagen: listaProfesor[index].imagen,
                    nombApellido: listaProfesor[index].nombApellido,
                    aula: listaProfesor[index].aula,
                    press1: () {},
                  ),
                ),
              )),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding),
            sliver:
                SliverToBoxAdapter(child: Image.asset("assets/bannerhome.jpg")),
          ),
          SliverPadding(
            padding: EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: SectionTitle(
                title: "Justificaciones",
                press: () {},
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                listaJustificacion.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: defaultPadding),
                  child: JustInfo(
                    detalle: listaJustificacion[index].detalle,
                    imagen: listaJustificacion[index].imagen,
                    motivo: listaJustificacion[index].motivo,
                    fecha: listaJustificacion[index].fecha,
                    press1: () {
                      Navigator.pushNamed(context, 'ruta_justificacion');
                    },
                  ),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfesorInfo extends StatelessWidget {
  const ProfesorInfo({
    Key? key,
    required this.curso,
    required this.imagen,
    required this.nombApellido,
    required this.aula,
    required this.press1,
  }) : super(key: key);

  final String curso, imagen, nombApellido, aula;
  final VoidCallback press1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      onTap: press1,
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
                aspectRatio: 1.25,
                child: FadeInImage(
                  image: NetworkImage(imagen),
                  placeholder: AssetImage("assets/loading.gif"),
                )),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            Text(
              nombApellido,
              style: Theme.of(context).textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              child: DefaultTextStyle(
                style: TextStyle(color: Colors.black, fontSize: 12),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2,
                            vertical: defaultPadding / 8),
                        decoration: BoxDecoration(
                          color: kActiveColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          aula.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: Color(0xFF868686),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class JustInfo extends StatelessWidget {
  const JustInfo({
    Key? key,
    required this.detalle,
    required this.imagen,
    required this.motivo,
    required this.fecha,
    required this.press1,
  }) : super(key: key);

  final String detalle, imagen, motivo, fecha;
  final VoidCallback press1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      onTap: press1,
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
                aspectRatio: 1.25,
                child: FadeInImage(
                  image: NetworkImage(imagen),
                  placeholder: AssetImage("assets/loading.gif"),
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            Text(
              detalle,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              motivo,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kBodyTextColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              child: DefaultTextStyle(
                style: TextStyle(color: Colors.black, fontSize: 12),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding / 2,
                          vertical: defaultPadding / 8),
                      decoration: BoxDecoration(
                        color: kActiveColor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        fecha.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: Color(0xFF868686),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(title, style: Theme.of(context).textTheme.headline6),
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, "ruta_justificacion");
        },
        style: TextButton.styleFrom(primary: kActiveColor),
        child: Text("Ver todo"),
      )
    ]);
  }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    Key? key,
    required this.listaHome,
  }) : super(key: key);

  final List<Home> listaHome;

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.81,
        child: Stack(alignment: Alignment.bottomRight, children: [
          PageView.builder(
            itemCount: widget.listaHome.length,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemBuilder: (context, index) => FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(widget.listaHome[index].image),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: defaultPadding,
            right: defaultPadding,
            child: Row(
              children: List.generate(
                  widget.listaHome.length,
                  (index) => Padding(
                        padding:
                            const EdgeInsets.only(left: defaultPadding / 4),
                        child: IndicatorDot(isActive: index == _currentPage),
                      )),
            ),
          )
        ]));
  }
}

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    Key? key,
    required this.isActive,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white38,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }
}
