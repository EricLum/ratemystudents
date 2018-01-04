require 'spec_helper'
require 'rails_helper'

describe Comment do
  let(:comment) {subject}

  it 'belongs to a teacher' do
    teacher = Teacher.create
    comment = Comment.create
    teacher.comments << comment
    teacher.save
    expect(teacher.comments).to include(comment)
  end
end
