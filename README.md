<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This Package is capable of helping developers who needs a profile picture in their app from sketching this feature.
## Features

Profile Picture Helper with the pick image button

## Getting started

Just import the package and enjoy relaxing from sketching the profile picture ui

## Usage
[
class _MyApplicationState extends State<MyApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ProfilePicture(
            newImagePath: ((value) {
              //get the image path for any reason from the value
              log(value);
            }),
            iconColor: Colors.green,
            defaultImage:
                "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80"));
  }
}]

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
