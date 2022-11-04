import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    this.textInputAction = TextInputAction.done,
    this.description,
    this.labelText,
    this.onTextChange,
    this.focusNode,
    this.onSubmit,
    this.initialText,
    this.controller,
    this.placeholder,
    this.hintMaxLines,
    this.textStyle,
    this.placeholderTextStyle,
    this.minLine,
    this.maxLength,
    this.maxLine,
    this.keyboardType,
    this.onFocusChange,
    this.shouldShowErrorMessage = true,
    this.shouldShowIconClear = false,
    this.minHeight,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.isPassword = false,
    this.textFieldKey,
    this.validator,
    this.inputFormatters,
    this.backgroundColor,
    this.iconColor,
    // this.obscuringCharacter,
    this.isActive = true,
    this.isAutoDisposeController = true,
    this.isAutoValidateWhenOutFocus = true,
    Key? key,
  }) : super(key: key);

  const InputTextField.singleLine({
    this.onTextChange,
    this.description,
    this.labelText,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.onSubmit,
    this.initialText,
    this.controller,
    this.placeholder,
    this.hintMaxLines,
    this.textStyle,
    this.maxLength,
    this.placeholderTextStyle,
    this.keyboardType,
    this.onFocusChange,
    this.shouldShowErrorMessage = true,
    this.shouldShowIconClear = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.isPassword = false,
    this.textFieldKey,
    this.validator,
    this.inputFormatters,
    this.backgroundColor,
    this.iconColor,
    // this.obscuringCharacter,
    this.isActive = true,
    this.isAutoDisposeController = true,
    this.isAutoValidateWhenOutFocus = true,
    Key? key,
  })  : minHeight = null,
        minLine = 1,
        maxLine = 1,
        super(key: key);

  const InputTextField.expandable({
    this.onTextChange,
    this.description,
    this.labelText,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.onSubmit,
    this.initialText,
    this.controller,
    this.placeholder,
    this.hintMaxLines,
    this.textStyle,
    this.minLine,
    this.maxLength,
    this.placeholderTextStyle,
    this.onFocusChange,
    this.shouldShowErrorMessage = true,
    this.shouldShowIconClear = false,
    this.minHeight,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.isPassword = false,
    this.textFieldKey,
    this.validator,
    this.inputFormatters,
    this.backgroundColor,
    this.iconColor,
    // this.obscuringCharacter,
    this.isActive = true,
    this.isAutoDisposeController = true,
    this.isAutoValidateWhenOutFocus = true,
    Key? key,
  })  : keyboardType = TextInputType.multiline,
        maxLine = null,
        super(key: key);

  final String? initialText;
  final String? description;
  final String? labelText;
  final VoidCallback? onSubmit;
  final GlobalKey<FormFieldState>? textFieldKey;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? placeholder;
  final int? hintMaxLines;
  final TextStyle? textStyle;
  final TextStyle? placeholderTextStyle;
  final ValueChanged<String?>? onTextChange;
  final ValueChanged<bool>? onFocusChange;
  final int? minLine;
  final int? maxLine;
  final int? maxLength;
  final TextInputType? keyboardType;
  // final String? obscuringCharacter;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final double? minHeight;

  final bool shouldShowErrorMessage;
  final bool shouldShowIconClear;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool isPassword;

  final bool isAutoDisposeController;
  final bool isAutoValidateWhenOutFocus;

  final bool isActive;

  final Color? backgroundColor;
  final Color? iconColor;

  @override
  State<InputTextField> createState() => _TextBoxState();
}

class _TextBoxState extends State<InputTextField> {
  bool _obscureText = false;

  late final TextEditingController _textController;
  late final GlobalKey<FormFieldState> _textFieldKey;
  late final FocusNode _focusNode;

  var _isTextEmpty = true;
  var _currentTextLength = 0;

  // Use this to hide default error message for InputTextField
  final TextStyle _hiddenTextStyle = const TextStyle(
    height: 0.01,
    color: Colors.transparent,
  );

  @override
  void initState() {
    _textController =
        widget.controller ?? TextEditingController(text: widget.initialText);
    if (widget.isPassword) {
      _obscureText = true;
    }
    _isTextEmpty = _textController.text.isEmpty;
    _textFieldKey = widget.textFieldKey ?? GlobalKey<FormFieldState>();
    _focusNode = widget.focusNode ?? FocusNode();
    _currentTextLength = _textController.text.length;

    _textController.addListener(() {
      if (mounted) {
        setState(() {
          _currentTextLength = _textController.text.length;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    if (widget.isAutoDisposeController) {
      _textController.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  String? get _errorMessage {
    return _textFieldKey.currentState?.errorText;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isActive ? 1 : 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: widget.minHeight == null ? null : Alignment.topLeft,
            constraints: widget.minHeight == null
                ? null
                : BoxConstraints(minHeight: widget.minHeight!),
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? context.colors.backdropSecondary,
              borderRadius: BorderRadius.circular(8),
              border: _errorMessage != null
                  ? Border.all(color: context.colors.error, width: 1)
                  : Border.all(
                      color: context.colors.backdropPrimary,
                      width: 1,
                    ),
            ),
            child: Row(
              children: [
                Flexible(
                  child: Focus(
                    onFocusChange: (focus) {
                      widget.onFocusChange?.call(focus);

                      if (!focus && widget.isAutoValidateWhenOutFocus) {
                        setState(() {
                          _textController.text = _textController.text.trim();
                          widget.onTextChange?.call(_textController.text);
                          _textFieldKey.currentState?.validate();
                        });
                      }
                    },
                    child: TextFormField(
                      key: _textFieldKey,
                      enabled: widget.isActive,
                      onEditingComplete: widget.onSubmit,
                      onChanged: (value) {
                        setState(() {
                          _isTextEmpty = value.isEmpty;
                        });
                        widget.onTextChange?.call(value);
                      },
                      obscureText: _obscureText,
                      // obscuringCharacter: widget.obscuringCharacter ??
                      // Constants.obscuringCharacter,
                      enableSuggestions: widget.enableSuggestions,
                      autocorrect: widget.autocorrect,
                      validator: widget.validator,
                      inputFormatters: widget.inputFormatters,
                      readOnly: false,
                      keyboardType: widget.keyboardType,
                      minLines: widget.minLine,
                      maxLines: widget.maxLine,
                      controller: _textController,
                      focusNode: _focusNode,
                      textInputAction: widget.textInputAction,
                      style: widget.textStyle ??
                          AppTextStyles.textMedium.copyWith(
                            color: context.colors.textPrimary,
                          ),
                      decoration: InputDecoration(
                        labelText: widget.labelText,
                        border: InputBorder.none,
                        hintText: widget.placeholder,
                        isDense: true,
                        hintStyle: widget.placeholderTextStyle ??
                            AppTextStyles.textMedium.copyWith(
                              color: context.colors.textSecondary,
                            ),
                        isDense: true,
                        hintMaxLines: widget.hintMaxLines,
                        errorStyle: _hiddenTextStyle,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                if (widget.shouldShowIconClear) _buildClearIconView(context),
                if (widget.isPassword) _buildPasswordToggleView(context),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (widget.shouldShowErrorMessage && _errorMessage != null)
                Expanded(
                  child: _buildErrorText(
                    context,
                    error: _errorMessage!,
                  ),
                ),
              if (widget.description != null && _errorMessage == null)
                Expanded(
                  child: _buildDescriptionText(context,
                      description: widget.description!),
                ),
              if (widget.maxLength != null) _buildCounterTextView(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildErrorText(
    BuildContext context, {
    required String error,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        error,
        style: AppTextStyles.textSmall.copyWith(color: context.colors.error),
      ),
    );
  }

  Widget _buildDescriptionText(
    BuildContext context, {
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Text(
        description,
        style: AppTextStyles.textSmall.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildCounterTextView(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          '$_currentTextLength/${widget.maxLength}',
          style: AppTextStyles.textSmall.copyWith(
            color: _currentTextLength > widget.maxLength!
                ? context.colors.error
                : context.colors.textSecondary,
          ),
          textAlign: TextAlign.right,
        ));
  }

  Widget _buildClearIconView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
      ),
      child: GestureDetector(
        onTap: _isTextEmpty
            ? null
            : () {
                setState(() {
                  _textController.clear();
                  _currentTextLength = 0;
                });
                _textFieldKey.currentState?.validate();
                widget.onTextChange?.call('');
              },
        child: Icon(
          Icons.cancel,
          color: context.colors.iconSecondary,
        ),
      ),
    );
  }

  Widget _buildPasswordToggleView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
      ),
      child: GestureDetector(
        child: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: widget.iconColor ?? context.colors.iconPrimary,
          size: 22,
        ),
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}
