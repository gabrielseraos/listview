//
// view > produto_view.dart
//
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controller/produto_controller.dart';

class ProdutoView extends StatefulWidget {
  const ProdutoView({super.key});

  @override
  State<ProdutoView> createState() => _ProdutoViewState();
}

class _ProdutoViewState extends State<ProdutoView> {
  final ctrl = GetIt.I.get<ProdutoController>();

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Produtos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            onPressed: () => ctrl.alterarVisualizacao(true),
            icon: Icon(
              Icons.view_list_outlined,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => ctrl.alterarVisualizacao(false),
            icon: Icon(Icons.grid_view_outlined, color: Colors.white),
          ),
        ],
      ),
      //
      // CORPO
      //
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ctrl.visualizarLista ? visualizarLista() : visualizarGrid(),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Widget visualizarLista() {
    return SizedBox(
      //height: 100,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: ctrl.produtos.length,
        itemBuilder: (context, index) {
          final item = ctrl.produtos[index];
          return SizedBox(
            width: 150,
            child: Card(
              child: ListTile(
                title: Text(item.nome),
                subtitle: Text('R\$ ${item.preco.toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete_outline),
                  onPressed: () => ctrl.removerItem(index),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget visualizarGrid() {
    return SizedBox(
      child: GridView.builder(
        itemCount: ctrl.produtos.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //número de colunas
          crossAxisSpacing: 20, //espaçamento entre colunas
          mainAxisSpacing: 20, // espaçemento entre linhas
          childAspectRatio: 1.0, // razão aspecto (largura/altura)
        ),
        itemBuilder: (context, index) {
          final item = ctrl.produtos[index];
          return SizedBox(
            width: 150,
            child: Card(
              child: ListTile(
                title: Text(item.nome),
                subtitle: Text('R\$ ${item.preco.toStringAsFixed(2)}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
