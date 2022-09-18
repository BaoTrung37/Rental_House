import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:batru_house_rental/presentation/utilities/enums/loading_status.dart';
import 'package:batru_house_rental/presentation/widgets/app_indicator/app_loading_indicator.dart';
import 'package:batru_house_rental/presentation/widgets/input_text_field/input_text_field.dart';
import 'package:flutter/material.dart';

class ChatInputView extends StatefulWidget {
  const ChatInputView({
    required this.controller,
    required this.onSendButtonTapped,
    this.loadingStatus = LoadingStatus.initial,
    this.onFocusChange,
    this.focusNode,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final LoadingStatus loadingStatus;
  final ValueChanged<String> onSendButtonTapped;
  final ValueChanged<bool>? onFocusChange;
  final FocusNode? focusNode;
  @override
  State<ChatInputView> createState() => _ChatInputViewState();
}

class _ChatInputViewState extends State<ChatInputView> {
  late final _textFieldKey = GlobalKey<FormFieldState>();

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
    if (widget.loadingStatus == LoadingStatus.inProgress) {
      return const SizedBox(
        height: 20,
        width: 20,
        child: AppLoadingIndicator(),
      );
    }
    return Visibility(
      visible: widget.controller.text.isNotEmpty,
      child: IconButton(
        onPressed: () {
          sendMessage();
          print('text3: ${widget.controller.text}');
        },
        icon: AppIcons.send(),
        constraints: const BoxConstraints(),
      ),
    );
  }

  void sendMessage() {
    setState(() {
      if (_textFieldKey.currentState?.validate() == true) {
        if (widget.controller.text.isNotEmpty) {
          widget.onSendButtonTapped(
            widget.controller.text,
          );
        }
        widget.controller.clear();
      }
    });
  }

  Widget _buildTextField() => InputTextField(
        placeholder: 'Type a message',
        onTextChange: (value) {
          setState(() {
            widget.controller.text = value!;
          });
        },
        onSubmit: sendMessage,
        textFieldKey: _textFieldKey,
        minLine: 1,
        controller: widget.controller,
        keyboardType: TextInputType.multiline,
        isAutoDisposeController: false,
        isAutoValidateWhenOutFocus: false,
      );
}
