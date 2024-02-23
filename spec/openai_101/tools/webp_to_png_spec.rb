# frozen_string_literal: true

RSpec.describe Openai101::Tools::WebpToPng, :tools_enabled do
  subject { described_class.new(target_folder: target_folder, target_filename: target_filename, prefix: prefix) }

  # let(:target_folder) { '/Volumes/Expansion/Sync/video-editing/images' }
  let(:target_folder) { '/Volumes/Expansion/Sync/tube-channels/a-cast/cast-active/a35-automate-image-generation/assets' }

  context 'transfer last ChatGPT .webp image to course folder as .png' do
    let(:prefix) { nil }
    # let(:day) { '1'}
    let(:target_filename) { "a" }

    xit 'transfer last image in downloads folder' do
      if subject.source?
        subject
          .convert
          .store_prompt
          .backup_source
          .delete_source
      else
        puts "\e[31mNo source file found\e[0m"
      end
    end

    xit 'clear backup folder' do
      subject.clear_backup
    end
  end
end
