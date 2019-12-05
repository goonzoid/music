(
  // http://doc.sccode.org/Classes/ServerOptions.html
  s.options.numBuffers = 1024 * 256; // increase this if you need to load more samples
  s.options.memSize = 8192 * 16; // increase this if you get "alloc failed" messages
  s.options.maxNodes = 1024 * 32; // increase this if you are getting drop outs and the message "too many nodes"

  s.options.numOutputBusChannels = 2;
  s.options.numInputBusChannels = 0;

  s.waitForBoot {
    ~dirt = SuperDirt(2, s); // two output channels
    ~dirt.loadSoundFiles("~/Dropbox/Sounds/SuperDirt/*");
    ~dirt.loadSoundFiles("~/Library/Application Support/SuperCollider/downloaded-quarks/Dirt-Samples/*");
    s.sync;
    ~dirt.start(57120, [0, 0]); // start listening on port 57120, create two busses each sending audio to channel 0
  };

  s.latency = 0.3; // increase this if you get "late" messages
);
