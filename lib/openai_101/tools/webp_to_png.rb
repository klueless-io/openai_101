# frozen_string_literal: true

require 'mini_magick'

module Openai101
  module Tools
    # Convert WebP to PNG
    class WebpToPng
      attr_reader :source_folder
      attr_reader :target_folder
      attr_reader :target_filename
      attr_reader :prefix

      def initialize(target_filename:, source_folder: nil, target_folder: nil, prefix: nil)
        root = File.expand_path('../../..', __dir__)
        @source_folder = source_folder || ENV.fetch('DOWNLOAD_DIR', nil)
        @target_folder = target_folder || File.join(root, 'course/images')
        @target_filename = target_filename
        @prefix = prefix
      end

      def convert
        puts "\e[31m#{source_filename}\e[0m"
        image = MiniMagick::Image.open(source_filename)
        image.format 'png'
        image.write target_png_file

        self
      end

      def store_prompt
        File.write(target_prompt_file, prompt)

        self
      end

      def backup_source
        backup_filename = File.basename(source_filename, '.webp')
        backup = target_path(backup_filename, 'webp', subfolder: 'backups')
        FileUtils.cp(source_filename, backup)

        self
      end

      def delete_source
        File.delete(source_filename)

        self
      end

      def clear_backup
        FileUtils.rm_rf(File.join(target_folder, 'backups'))

        self
      end

      def target_file
        prefix ? "#{prefix}-#{target_filename}" : target_filename
      end

      def target_png_file
        target_path(target_file, 'png')
      end

      def target_prompt_file
        target_path(target_file, 'txt', subfolder: 'prompts')
      end

      def prompt
        grab_prompt(File.basename(source_filename))
      end

      def source?
        !source_filename.nil?
      end

      def source_filename
        @source_filename ||= find_last_webp_file(source_folder)
      end

      def sanitize_all_webp_files
        file_changed = false
        puts '1'
        Dir.glob(File.join(source_folder, '*.webp')).each do |file_path|
          sanitized_filename = sanitize_filename(File.basename(file_path))
          sanitized_path = File.join(File.dirname(file_path), sanitized_filename)
          puts sanitized_path
          if file_path != sanitized_path
            FileUtils.mv(file_path, sanitized_path)
            file_changed = true
          end
        end
        sleep(3) if file_changed # Pause if any file was renamed
      end

      private

      def sanitize_filename(filename)
        filename.gsub(/[^0-9A-Za-z.\-]/, '_')
      end

      def target_path(filename, extension = nil, subfolder: nil, make_folder: true)
        folder = subfolder ? File.join(target_folder, subfolder) : target_folder

        FileUtils.mkdir_p(folder) if make_folder

        if extension.nil?
          File.join(folder, filename)
        else
          File.join(folder, "#{filename}.#{extension}")
        end
      end

      def find_last_webp_file(path)
        Dir.glob(File.join(path, '*.webp')).max_by { |f| File.mtime(f) }
      end

      def grab_prompt(filename)
        match = filename.match(/DALL_E_\d{4}-\d{2}-\d{2}_\d{2}\.\d{2}\.\d{2}_-_(.+)\.webp$/)
        match[1] if match
      end
    end
  end
end
