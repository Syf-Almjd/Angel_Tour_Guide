import 'dart:convert';

import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/cupertino.dart';

class alan_ai {
  alan_ai() {
    AlanVoice.addButton(
        "2577724c45a994530d6504bb8b099e892e956eca572e1d8b807a3e2338fdd0dc/stage");

    /// ... or init Alan Button with project key and additional params
    // var params = jsonEncode({"uuid":"111-222-333-444"});
    // AlanVoice.addButton("8e0b083e795c924d64635bba9c3571f42e956eca572e1d8b807a3e2338fdd0dc/stage", authJson: params);

    /// Set log level - "all", "none"
    AlanVoice.setLogLevel("none");

    /// Add button state handler
    AlanVoice.onButtonState.add((state) {

      debugPrint("got new button state ${state.name}");
    });

    /// Add command handler
    AlanVoice.onCommand.add((command) {
        debugPrint("got new command ${command.toString()}");
    });

    /// Add event handler
    AlanVoice.onEvent.add((event) {
      // if (event.toString().contains("not good"))
      // {
      //   AlanVoice.deactivate();
      //   AlanVoice.sendText("hello");
      // }
      // debugPrint("got new event ${event.data.keys}");

      debugPrint("got new event ${event.data.toString()}");
    });

    /// Activate Alan Button
    // ignore: unused_element
    void _activate() {
      AlanVoice.activate();
    }

    /// Deactivate Alan Button
    // ignore: unused_element
    void _deactivate() {
      AlanVoice.deactivate();
    }

    /// Send any text via Alan Button
    // ignore: unused_element
    void _sendText() {
      /// Provide text as string param
      AlanVoice.sendText("Hello from Alan!");

    }

    /// Play any text via Alan Button
    // ignore: unused_element
    void playText(String talk) {
      /// Provide text as string param
      AlanVoice.playText(talk);
    }

    /// Execute any command locally (and handle it with onCommand callback)
    // ignore: unused_element
    void _playCommand() {
      /// Provide any params with json
      var command = jsonEncode({"command": "commandName"});
      AlanVoice.playCommand(command);
    }

    /// Call project API from Alan Studio script
    // ignore: unused_element
    void _callProjectApi() {
      /// Provide any params with json
      var params = jsonEncode({"apiParams": "paramsValue"});
      AlanVoice.callProjectApi("projectAPI", params);
    }

    /// Set visual state in Alan Studio script
    // ignore: unused_element
    void _setVisualState() {
      /// Provide any params with json
      var visualState = jsonEncode({"visualState": "stateValue"});
      AlanVoice.setVisualState(visualState);
    }
  }

  }

