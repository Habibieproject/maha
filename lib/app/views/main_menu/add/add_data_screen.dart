import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maha/app/bloc/user/user_cubit.dart';
import 'package:maha/app/common/constant/export/export_constant.dart';
import 'package:maha/app/common/query/query.dart';
import 'package:maha/app/utils/components/validator.dart';
import 'package:maha/app/utils/widgets/default_button.dart';
import 'package:maha/app/utils/widgets/text_field.dart';
import 'package:maha/app/utils/widgets/title_field.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});
  static const id = "/add_data_screen";

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final nameController = TextEditingController();
  final jobController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data'),
      ),
      body: Padding(
        padding: sizePaddingAll(context),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                color: AppColor.kWhiteColor,
                child: Column(
                  children: [
                    const TitleTextFieldConst(title: "Nama"),
                    spaceHeight02,
                    CustomTextField(
                      controller: nameController,
                      hintText: 'Masukkan nama',
                      validator: (p0) => Validators.notEmpty(
                          nameController.text,
                          text: "Nama"),
                    ),
                    spaceHeight04,
                    const TitleTextFieldConst(title: "Profesi"),
                    spaceHeight02,
                    CustomTextField(
                      controller: jobController,
                      hintText: 'Masukkan Profesi',
                      validator: (p0) => Validators.notEmpty(jobController.text,
                          text: "Profesi"),
                    ),
                    spaceHeight04,
                    Row(
                      children: [
                        DefaultButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            } else {
                              context.read<UserCubit>().postUser(
                                  nameController.text, jobController.text);
                            }
                          },
                          text: "Tambah",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              spaceHeight02,
              Expanded(
                child: BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    if (state is PostHistoryLoaded) {
                      final postHistory = state.postHistory;

                      if (postHistory.isEmpty) {
                        return const Center(child: Text('Tidak ada data'));
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: postHistory.length,
                        itemBuilder: (context, index) {
                          final post = postHistory[index];
                          final Color backgroundColor =
                              index % 2 == 0 ? Colors.white : Colors.grey[200]!;
                          return Dismissible(
                            key: Key(post['id']),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              context.read<UserCubit>().deletePost(index);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('${post['name']} telah dihapus'),
                                ),
                              );
                            },
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child:
                                  const Icon(Icons.delete, color: Colors.white),
                            ),
                            child: ListTile(
                              tileColor: backgroundColor,
                              title: Text(
                                'Name: ${post['name']}',
                                style: AppStyle.semiBold(
                                    fontSize: FontSize.font12),
                              ),
                              subtitle: Text(
                                'Job: ${post['job']}',
                                style: AppStyle.semiBold(
                                    fontSize: FontSize.font12),
                              ),
                              trailing: Text(
                                'ID: ${post['id']}',
                                style: AppStyle.semiBold(
                                    fontSize: FontSize.font12),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
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
