# frozen_string_literal: true

RSpec.describe Openai101::Tools::EdlToChapters, :tools_enabled do

  # let(:target_folder) { '/Volumes/Expansion/Sync/video-editing/images' }
  let(:edl_content) do
    <<-TEXT
      TITLE: a36
      FCM: NON-DROP FRAME
      
      001  001      V     C        00:00:09:16 00:00:09:17 00:00:09:16 00:00:09:17  
       |C:ResolveColorBlue |M:Hey Code Voice Commands |D:1
      
      002  001      V     C        00:00:53:13 00:00:53:14 00:00:53:13 00:00:53:14  
       |C:ResolveColorBlue |M:Keyboard Shortcuts |D:1
      
      003  001      V     C        00:01:17:20 00:01:17:21 00:01:17:20 00:01:17:21  
       |C:ResolveColorBlue |M:Create code using voice |D:1
      
      004  001      V     C        00:02:17:25 00:02:17:26 00:02:17:25 00:02:17:26  
       |C:ResolveColorBlue |M:Next steps |D:1
    TEXT
  end

  context 'when EDL content is provided' do
    subject { described_class.new(content: edl_content) }

    let(:expected_chapters) do
      [
        "00:00:09 Hey Code Voice Commands",
        "00:00:53 Keyboard Shortcuts",
        "00:01:17 Create code using voice",
        "00:02:17 Next steps",
      ].join("\n")
    end

    it 'converts EDL to chapters' do
      expect(subject.convert).to eq(expected_chapters)
    end
  end

  context 'when EDL file is provided' do
    let(:edl_file) { '/Volumes/Expansion/Sync/tube-channels/a-cast/cast-active/a36-voice-commands-in-vscode/a36.edl' }
    let(:chapter_file) { '/Volumes/Expansion/Sync/tube-channels/a-cast/cast-active/a36-voice-commands-in-vscode/chapters.txt' }
    subject { described_class.new(file: edl_file) }

    xit 'converts EDL to chapters' do
      chapters = subject.convert
      File.write(chapter_file, chapters)
    end
  end
end
