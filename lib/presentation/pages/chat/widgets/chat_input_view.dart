import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:batru_house_rental/presentation/widgets/input_text_field/input_text_field.dart';
import 'package:flutter/material.dart';

class ChatInputView extends StatefulWidget {
  const ChatInputView({
    required this.onSendButtonTapped,
    this.loadingStatus = LoadingStatus.initial,
    Key? key,
  }) : super(key: key);

  final LoadingStatus loadingStatus;
  final ValueChanged<String> onSendButtonTapped;
  @override
  State<ChatInputView> createState() => _ChatInputViewState();
}

class _ChatInputViewState extends State<ChatInputView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          AppIcons.image(color: context.colors.iconSecondary),
          const SizedBox(width: 10),
          Expanded(
            child: _buildTextField(),
          ),
          _buildSendButton(),
        ],
      ),
    );
  }

  Widget _buildSendButton() {
    return AppButton(
      // buttonState: LoadingStatus.initial,
      backgroundColor: Colors.transparent,
      leftIcon: AppIcons.send(),
      onButtonTap: () {
        sendMessage();
        // print('text3: ${widget.controller.text}');
      },
    );
  }

  void sendMessage() {
    setState(() {
      // if (_textFieldKey.currentState?.validate() == true) {
      //   if (widget.controller.text.isNotEmpty) {
      //     widget.onSendButtonTapped(
      //       widget.controller.text,
      //     );
      //   }
      //   widget.controller.clear();
      // }
    });
  }

  Widget _buildTextField() => InputTextField.singleLine(
        placeholder: 'Type a message',
        onTextChange: (value) {
          // setState(() {
          //   widget.controller.text = value!;
          // });
        },
        onSubmit: sendMessage,
        keyboardType: TextInputType.multiline,
        isAutoDisposeController: false,
        isAutoValidateWhenOutFocus: false,
      );
}
