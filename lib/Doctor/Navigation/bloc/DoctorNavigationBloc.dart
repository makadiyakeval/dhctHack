import 'package:dhct/Doctor/Screen/DoctorBarcode.dart';
import 'package:dhct/Doctor/Screen/DoctorBlog.dart';
import 'package:dhct/Doctor/Screen/DoctorMyPatients.dart';
import 'package:dhct/Doctor/Screen/DoctorProfile.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

enum DoctorNavigationEvents {
  DoctorMyProfileClickedEvent,
  DoctorMyPatientClickedEvent,
  DoctorMyBlogClickedEvent,
  DoctorBarCodeClickedEvent,
}

abstract class DoctorNavigationStates {}

class DoctorNavigationBloc extends Bloc<DoctorNavigationEvents, DoctorNavigationStates> {
  final Function onDoctorNavMenuIconTap;
  final bool isMenuOpen;

  DoctorNavigationBloc({this.isMenuOpen, @required this.onDoctorNavMenuIconTap});

  @override
  DoctorNavigationStates get initialState => DoctorProfile(
        onDoctorNavMenuIconTap: onDoctorNavMenuIconTap,
        isMenuOpen: isMenuOpen,
      );

  @override
  Stream<DoctorNavigationStates> mapEventToState(DoctorNavigationEvents event) async* {
    switch (event) {
      case DoctorNavigationEvents.DoctorMyProfileClickedEvent:
        yield DoctorProfile(
          onDoctorNavMenuIconTap: onDoctorNavMenuIconTap,
          isMenuOpen: isMenuOpen,
        );
        break;
      case DoctorNavigationEvents.DoctorMyBlogClickedEvent:
        yield DoctorBlog(
          onDoctorNavMenuIconTap: onDoctorNavMenuIconTap,
          isMenuOpen: isMenuOpen,
        );
        break;
      case DoctorNavigationEvents.DoctorMyPatientClickedEvent:
        yield DoctorMyPatients(
          onDoctorNavMenuIconTap: onDoctorNavMenuIconTap,
          isMenuOpen: isMenuOpen,
        );
        break;
      case DoctorNavigationEvents.DoctorBarCodeClickedEvent:
        yield DoctorBarcode(
          onDoctorNavMenuIconTap: onDoctorNavMenuIconTap,
          isMenuOpen: isMenuOpen,
        );
        break;
    }
  }
}
