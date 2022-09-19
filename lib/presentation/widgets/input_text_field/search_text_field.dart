import 'package:batru_house_rental/presentation/resources/resources.dart';
import 'package:flutter/material.dart';

class SearchInputTextField extends StatefulWidget {
  const SearchInputTextField({
    this.onTextChange,
    this.initialText,
    this.controller,
    this.placeholder,
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
    this.textFieldKey,
    this.isDense = false,
    this.onFieldSubmitted,
    this.contentPadding,
    this.leading,
    Key? key,
  }) : super(key: key);

  const SearchInputTextField.singleLine({
    required this.onTextChange,
    this.initialText,
    this.controller,
    this.placeholder,
    this.textStyle,
    this.maxLength,
    this.placeholderTextStyle,
    this.keyboardType,
    this.onFocusChange,
    this.shouldShowErrorMessage = true,
    this.shouldShowIconClear = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.textFieldKey,
    this.isDense = false,
    this.onFieldSubmitted,
    this.contentPadding,
    this.leading,
    Key? key,
  })  : minHeight = null,
        minLine = 1,
        maxLine = 1,
        super(key: key);

  final String? initialText;

  final GlobalKey<FormFieldState>? textFieldKey;
  final TextEditingController? controller;
  final String? placeholder;
  final TextStyle? textStyle;
  final TextStyle? placeholderTextStyle;
  final ValueChanged<String?>? onTextChange;
  final ValueChanged<String>? onFieldSubmitted;

  final ValueChanged<bool>? onFocusChange;
  final int? minLine;
  final int? maxLine;
  final int? maxLength;
  final TextInputType? keyboardType;

  final double? minHeight;

  final bool shouldShowErrorMessage;
  final bool shouldShowIconClear;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool isDense;
  final Widget? leading;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<SearchInputTextField> createState() => _SearchTextBoxState();
}

class _SearchTextBoxState extends State<SearchInputTextField> {
  final _focusNode = FocusNode();

  late final TextEditingController _textController;
  late final GlobalKey<FormFieldState> _textFieldKey;
  var _isTextEmpty = true;

  @override
  void initState() {
    _textController =
        widget.controller ?? TextEditingController(text: widget.initialText);
    _isTextEmpty = _textController.text.isEmpty;
    _textFieldKey = widget.textFieldKey ?? GlobalKey<FormFieldState>();
    super.initState();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
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
    return Container(
      alignment: widget.minHeight == null ? null : Alignment.topLeft,
      constraints: widget.minHeight == null
          ? null
          : BoxConstraints(minHeight: widget.minHeight!),
      decoration: BoxDecoration(
        color: context.colors.action,
        borderRadius: BorderRadius.circular(8),
        border: _errorMessage != null
            ? Border.all(color: context.colors.error, width: 1)
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 6),
          AppIcons.search(color: context.colors.iconSecondary, size: 24),
          if (widget.leading != null) widget.leading!,
          Expanded(
            child: Focus(
              onFocusChange: (focus) {
                widget.onFocusChange?.call(focus);
              },
              child: _buildTextFromField(context),
            ),
          ),
          if (widget.shouldShowIconClear) _buildClearIconView(context),
        ],
      ),
    );
  }

  Widget _buildTextFromField(BuildContext context) {
    return TextFormField(
      key: _textFieldKey,
      onChanged: (value) {
        setState(() {
          _isTextEmpty = value.isEmpty;
        });
        widget.onTextChange?.call(value);
      },
      onFieldSubmitted: widget.onFieldSubmitted,
      enableSuggestions: widget.enableSuggestions,
      autocorrect: widget.autocorrect,
      readOnly: false,
      keyboardType: widget.keyboardType,
      minLines: widget.minLine,
      maxLines: widget.maxLine,
      controller: _textController,
      cursorColor: context.colors.primaryMain,
      focusNode: _focusNode,
      style: widget.textStyle ??
          AppTextStyles.textMedium.copyWith(
            color: context.colors.textPrimary,
          ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.placeholder,
        hintStyle: widget.placeholderTextStyle ??
            AppTextStyles.textMedium.copyWith(
              color: context.colors.textSecondary,
            ),
        focusedErrorBorder: InputBorder.none,
        isDense: widget.isDense,
        contentPadding: widget.contentPadding ??
            const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 12,
            ),
      ),
    );
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
                });
                _textFieldKey.currentState?.validate();
                widget.onTextChange?.call('');
              },
        child: AppIcons.close(
          color: context.colors.iconSecondary,
          size: 20,
        ),
      ),
    );
  }
}
