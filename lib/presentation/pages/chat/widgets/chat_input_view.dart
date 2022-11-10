import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:batru_house_rental/presentation/widgets/input_text_field/input_text_field.dart';
import 'package:flutter/material.dart';

class ChatInputView extends StatefulWidget {
  const ChatInputView({
    required this.onTextChanged,
    required this.onSendTap,
    Key? key,
  }) : super(key: key);

  final ValueChanged<String> onTextChanged;
  final VoidCallback onSendTap;
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
      onButtonTap: widget.onSendTap,
    );
  }

  Widget _buildTextField() => InputTextField.singleLine(
        placeholder: 'Nhập nội dung',
        onTextChange: (value) {
          widget.onTextChanged.call(value!);
        },
        keyboardType: TextInputType.multiline,
        isAutoDisposeController: false,
        isAutoValidateWhenOutFocus: false,
      );
}
