# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mail}
  s.version = "2.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mikel Lindsaar"]
  s.date = %q{2010-06-17}
  s.description = %q{A really Ruby Mail handler.}
  s.email = %q{raasdnil@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "CHANGELOG.rdoc", "TODO.rdoc"]
  s.files = ["README.rdoc", "Rakefile", "TODO.rdoc", "lib/mail/attachments_list.rb", "lib/mail/attachments_list.rbc", "lib/mail/body.rb", "lib/mail/body.rbc", "lib/mail/configuration.rb", "lib/mail/configuration.rbc", "lib/mail/core_extensions/nil.rb", "lib/mail/core_extensions/nil.rbc", "lib/mail/core_extensions/string.rb", "lib/mail/core_extensions/string.rbc", "lib/mail/elements/address.rb", "lib/mail/elements/address.rbc", "lib/mail/elements/address_list.rb", "lib/mail/elements/address_list.rbc", "lib/mail/elements/content_disposition_element.rb", "lib/mail/elements/content_disposition_element.rbc", "lib/mail/elements/content_location_element.rb", "lib/mail/elements/content_location_element.rbc", "lib/mail/elements/content_transfer_encoding_element.rb", "lib/mail/elements/content_transfer_encoding_element.rbc", "lib/mail/elements/content_type_element.rb", "lib/mail/elements/content_type_element.rbc", "lib/mail/elements/date_time_element.rb", "lib/mail/elements/date_time_element.rbc", "lib/mail/elements/envelope_from_element.rb", "lib/mail/elements/envelope_from_element.rbc", "lib/mail/elements/message_ids_element.rb", "lib/mail/elements/message_ids_element.rbc", "lib/mail/elements/mime_version_element.rb", "lib/mail/elements/mime_version_element.rbc", "lib/mail/elements/phrase_list.rb", "lib/mail/elements/phrase_list.rbc", "lib/mail/elements/received_element.rb", "lib/mail/elements/received_element.rbc", "lib/mail/elements.rb", "lib/mail/elements.rbc", "lib/mail/encodings/7bit.rb", "lib/mail/encodings/7bit.rbc", "lib/mail/encodings/8bit.rb", "lib/mail/encodings/8bit.rbc", "lib/mail/encodings/base64.rb", "lib/mail/encodings/base64.rbc", "lib/mail/encodings/binary.rb", "lib/mail/encodings/binary.rbc", "lib/mail/encodings/quoted_printable.rb", "lib/mail/encodings/quoted_printable.rbc", "lib/mail/encodings/transfer_encoding.rb", "lib/mail/encodings/transfer_encoding.rbc", "lib/mail/encodings.rb", "lib/mail/encodings.rbc", "lib/mail/envelope.rb", "lib/mail/envelope.rbc", "lib/mail/field.rb", "lib/mail/field.rbc", "lib/mail/field_list.rb", "lib/mail/field_list.rbc", "lib/mail/fields/bcc_field.rb", "lib/mail/fields/bcc_field.rbc", "lib/mail/fields/cc_field.rb", "lib/mail/fields/cc_field.rbc", "lib/mail/fields/comments_field.rb", "lib/mail/fields/comments_field.rbc", "lib/mail/fields/common/address_container.rb", "lib/mail/fields/common/address_container.rbc", "lib/mail/fields/common/common_address.rb", "lib/mail/fields/common/common_address.rbc", "lib/mail/fields/common/common_date.rb", "lib/mail/fields/common/common_date.rbc", "lib/mail/fields/common/common_field.rb", "lib/mail/fields/common/common_field.rbc", "lib/mail/fields/common/common_message_id.rb", "lib/mail/fields/common/common_message_id.rbc", "lib/mail/fields/common/parameter_hash.rb", "lib/mail/fields/common/parameter_hash.rbc", "lib/mail/fields/content_description_field.rb", "lib/mail/fields/content_description_field.rbc", "lib/mail/fields/content_disposition_field.rb", "lib/mail/fields/content_disposition_field.rbc", "lib/mail/fields/content_id_field.rb", "lib/mail/fields/content_id_field.rbc", "lib/mail/fields/content_location_field.rb", "lib/mail/fields/content_location_field.rbc", "lib/mail/fields/content_transfer_encoding_field.rb", "lib/mail/fields/content_transfer_encoding_field.rbc", "lib/mail/fields/content_type_field.rb", "lib/mail/fields/content_type_field.rbc", "lib/mail/fields/date_field.rb", "lib/mail/fields/date_field.rbc", "lib/mail/fields/from_field.rb", "lib/mail/fields/from_field.rbc", "lib/mail/fields/in_reply_to_field.rb", "lib/mail/fields/in_reply_to_field.rbc", "lib/mail/fields/keywords_field.rb", "lib/mail/fields/keywords_field.rbc", "lib/mail/fields/message_id_field.rb", "lib/mail/fields/message_id_field.rbc", "lib/mail/fields/mime_version_field.rb", "lib/mail/fields/mime_version_field.rbc", "lib/mail/fields/optional_field.rb", "lib/mail/fields/optional_field.rbc", "lib/mail/fields/received_field.rb", "lib/mail/fields/received_field.rbc", "lib/mail/fields/references_field.rb", "lib/mail/fields/references_field.rbc", "lib/mail/fields/reply_to_field.rb", "lib/mail/fields/reply_to_field.rbc", "lib/mail/fields/resent_bcc_field.rb", "lib/mail/fields/resent_bcc_field.rbc", "lib/mail/fields/resent_cc_field.rb", "lib/mail/fields/resent_cc_field.rbc", "lib/mail/fields/resent_date_field.rb", "lib/mail/fields/resent_date_field.rbc", "lib/mail/fields/resent_from_field.rb", "lib/mail/fields/resent_from_field.rbc", "lib/mail/fields/resent_message_id_field.rb", "lib/mail/fields/resent_message_id_field.rbc", "lib/mail/fields/resent_sender_field.rb", "lib/mail/fields/resent_sender_field.rbc", "lib/mail/fields/resent_to_field.rb", "lib/mail/fields/resent_to_field.rbc", "lib/mail/fields/return_path_field.rb", "lib/mail/fields/return_path_field.rbc", "lib/mail/fields/sender_field.rb", "lib/mail/fields/sender_field.rbc", "lib/mail/fields/structured_field.rb", "lib/mail/fields/structured_field.rbc", "lib/mail/fields/subject_field.rb", "lib/mail/fields/subject_field.rbc", "lib/mail/fields/to_field.rb", "lib/mail/fields/to_field.rbc", "lib/mail/fields/unstructured_field.rb", "lib/mail/fields/unstructured_field.rbc", "lib/mail/fields.rb", "lib/mail/fields.rbc", "lib/mail/header.rb", "lib/mail/header.rbc", "lib/mail/mail.rb", "lib/mail/mail.rbc", "lib/mail/message.rb", "lib/mail/message.rbc", "lib/mail/network/delivery_methods/file_delivery.rb", "lib/mail/network/delivery_methods/file_delivery.rbc", "lib/mail/network/delivery_methods/sendmail.rb", "lib/mail/network/delivery_methods/sendmail.rbc", "lib/mail/network/delivery_methods/smtp.rb", "lib/mail/network/delivery_methods/smtp.rbc", "lib/mail/network/delivery_methods/test_mailer.rb", "lib/mail/network/delivery_methods/test_mailer.rbc", "lib/mail/network/retriever_methods/imap.rb", "lib/mail/network/retriever_methods/pop3.rb", "lib/mail/network/retriever_methods/pop3.rbc", "lib/mail/network.rb", "lib/mail/network.rbc", "lib/mail/parsers/address_lists.rb", "lib/mail/parsers/address_lists.rbc", "lib/mail/parsers/address_lists.treetop", "lib/mail/parsers/content_disposition.rb", "lib/mail/parsers/content_disposition.rbc", "lib/mail/parsers/content_disposition.treetop", "lib/mail/parsers/content_location.rb", "lib/mail/parsers/content_location.rbc", "lib/mail/parsers/content_location.treetop", "lib/mail/parsers/content_transfer_encoding.rb", "lib/mail/parsers/content_transfer_encoding.rbc", "lib/mail/parsers/content_transfer_encoding.treetop", "lib/mail/parsers/content_type.rb", "lib/mail/parsers/content_type.rbc", "lib/mail/parsers/content_type.treetop", "lib/mail/parsers/date_time.rb", "lib/mail/parsers/date_time.rbc", "lib/mail/parsers/date_time.treetop", "lib/mail/parsers/envelope_from.rb", "lib/mail/parsers/envelope_from.rbc", "lib/mail/parsers/envelope_from.treetop", "lib/mail/parsers/message_ids.rb", "lib/mail/parsers/message_ids.rbc", "lib/mail/parsers/message_ids.treetop", "lib/mail/parsers/mime_version.rb", "lib/mail/parsers/mime_version.rbc", "lib/mail/parsers/mime_version.treetop", "lib/mail/parsers/phrase_lists.rb", "lib/mail/parsers/phrase_lists.rbc", "lib/mail/parsers/phrase_lists.treetop", "lib/mail/parsers/received.rb", "lib/mail/parsers/received.rbc", "lib/mail/parsers/received.treetop", "lib/mail/parsers/rfc2045.rb", "lib/mail/parsers/rfc2045.rbc", "lib/mail/parsers/rfc2045.treetop", "lib/mail/parsers/rfc2822.rb", "lib/mail/parsers/rfc2822.rbc", "lib/mail/parsers/rfc2822.treetop", "lib/mail/parsers/rfc2822_obsolete.rb", "lib/mail/parsers/rfc2822_obsolete.rbc", "lib/mail/parsers/rfc2822_obsolete.treetop", "lib/mail/part.rb", "lib/mail/part.rbc", "lib/mail/parts_list.rb", "lib/mail/parts_list.rbc", "lib/mail/patterns.rb", "lib/mail/patterns.rbc", "lib/mail/utilities.rb", "lib/mail/utilities.rbc", "lib/mail/version.rb", "lib/mail/version.rbc", "lib/mail/version_specific/ruby_1_8.rb", "lib/mail/version_specific/ruby_1_8.rbc", "lib/mail/version_specific/ruby_1_9.rb", "lib/mail.rb", "lib/mail.rbc", "lib/tasks/corpus.rake", "lib/tasks/corpus.rake.compiled.rbc", "lib/tasks/treetop.rake", "lib/tasks/treetop.rake.compiled.rbc", "lib/VERSION", "CHANGELOG.rdoc"]
  s.homepage = %q{http://github.com/mikel/mail}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Mail provides a nice Ruby DSL for making, sending and reading emails.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.6"])
      s.add_runtime_dependency(%q<mime-types>, [">= 0"])
      s.add_runtime_dependency(%q<treetop>, [">= 1.4.5"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.3.6"])
      s.add_dependency(%q<mime-types>, [">= 0"])
      s.add_dependency(%q<treetop>, [">= 1.4.5"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.3.6"])
    s.add_dependency(%q<mime-types>, [">= 0"])
    s.add_dependency(%q<treetop>, [">= 1.4.5"])
  end
end
