// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_scanner_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BarcodeScannerController on _BarcodeScannerControllerBase, Store {
  final _$statusAtom = Atom(name: '_BarcodeScannerControllerBase.status');

  @override
  BarcodeScannerStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(BarcodeScannerStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$getAvailableCamerasAsyncAction =
      AsyncAction('_BarcodeScannerControllerBase.getAvailableCameras');

  @override
  Future<void> getAvailableCameras() {
    return _$getAvailableCamerasAsyncAction
        .run(() => super.getAvailableCameras());
  }

  final _$scannerBarCodeAsyncAction =
      AsyncAction('_BarcodeScannerControllerBase.scannerBarCode');

  @override
  Future<void> scannerBarCode(InputImage inputImage) {
    return _$scannerBarCodeAsyncAction
        .run(() => super.scannerBarCode(inputImage));
  }

  final _$_BarcodeScannerControllerBaseActionController =
      ActionController(name: '_BarcodeScannerControllerBase');

  @override
  void scanWithCamera() {
    final _$actionInfo = _$_BarcodeScannerControllerBaseActionController
        .startAction(name: '_BarcodeScannerControllerBase.scanWithCamera');
    try {
      return super.scanWithCamera();
    } finally {
      _$_BarcodeScannerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
