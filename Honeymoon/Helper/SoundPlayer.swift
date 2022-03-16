//
//  SoundPlayer.swift
//  Honeymoon
//
//  Created by Micaella Morales on 3/15/22.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playMP3Sound(_ sound: String) {
  if let url = Bundle.main.url(forResource: sound, withExtension: "mp3") {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: url)
      audioPlayer?.play()
    } catch {
      print("Error: Could not find and play the sound file")
    }
  }
}
