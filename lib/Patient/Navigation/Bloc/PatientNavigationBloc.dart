import 'package:dhct/Patient/Screen/PatientBarcode.dart';
import 'package:dhct/Patient/Screen/PatientMyDocument.dart';
import 'package:dhct/Patient/Screen/PatientProfile.dart';
import 'package:dhct/Patient/Screen/PatientTracing.dart';
import 'package:dhct/Patient/Screen/PatientViewBlog.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

enum PatientNavigationEvents {
  PatientMyDocumentsClickedEvent,
  PatientBlogClickedEvent,
  PatientTracingClickedEvent,
  PatientMyProfileClickedEvent,
  PatientBarCodeClickedEvent,
}

abstract class PatientNavigationStates {}

class PatientNavigationBloc extends Bloc<PatientNavigationEvents, PatientNavigationStates> {
  final Function onPatientNavMenuIconTap;
  final bool isMenuOpen;

  PatientNavigationBloc({this.isMenuOpen, @required this.onPatientNavMenuIconTap});

  @override
  PatientNavigationStates get initialState => PatientProfile(
        onPatientNavMenuIconTap: onPatientNavMenuIconTap,
        isMenuOpen: isMenuOpen,
      );

  @override
  Stream<PatientNavigationStates> mapEventToState(PatientNavigationEvents event) async* {
    switch (event) {
      case PatientNavigationEvents.PatientMyDocumentsClickedEvent:
        yield PatientMyDocuments(
          onPatientNavMenuIconTap: onPatientNavMenuIconTap,
          isMenuOpen: isMenuOpen,
        );
        break;
      case PatientNavigationEvents.PatientBlogClickedEvent:
        yield PatientViewBlog(
          onPatientNavMenuIconTap: onPatientNavMenuIconTap,
          isMenuOpen: isMenuOpen,
        );
        break;
      case PatientNavigationEvents.PatientTracingClickedEvent:
        yield PatientTracing(
          onPatientNavMenuIconTap: onPatientNavMenuIconTap,
          isMenuOpen: isMenuOpen,
        );
        break;
      case PatientNavigationEvents.PatientMyProfileClickedEvent:
        yield PatientProfile(
          onPatientNavMenuIconTap: onPatientNavMenuIconTap,
          isMenuOpen: isMenuOpen,
        );
        break;
      case PatientNavigationEvents.PatientBarCodeClickedEvent:
        yield PatientBarcode(
          onPatientNavMenuIconTap: onPatientNavMenuIconTap,
          isMenuOpen: isMenuOpen,
        );
        break;
    }
  }
}
