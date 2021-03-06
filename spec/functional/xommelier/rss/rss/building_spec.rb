# coding: utf-8
# frozen_string_literal: true

################################################
# © Alexander Semyonov, 2011—2013, MIT License #
# Author: Alexander Semyonov <al@semyonov.us>  #
################################################

require 'spec_helper'

describe Xommelier::RSS do
  subject(:rss) do
    Xommelier::RSS::Rss.new(
      channel: {
        title: 'Example Feed',
        link: 'http://example.com',
        pub_date: Time.utc(2003, 6, 10, 4),
        last_build_date: Time.utc(2003, 12, 13, 18, 30, 2),
        managing_editor: 'john.doe@example.com',
        items: [{
          title: 'RSS-Powered Robots Run Amok',
          guid: 'urn:uuid:1225c695-cfb8-4ebb-aaaa-80da344efa6a',
          pub_date: Time.utc(2003, 12, 13, 18, 30, 2),
          description: 'Some text.',
          link: 'http://example.org/2003/12/13/atom03'
        }]
      }
    )
  end

  it_behaves_like 'Valid XML Document'
  its(:to_xml) { should == load_xml_file('simple_feed.rss') }
end
