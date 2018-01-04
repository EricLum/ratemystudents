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

  it 'belongs to a student' do
    student = Student.create
    comment = Comment.create
    student.comments << comment
    student.save
    expect(student.comments).to include(comment)
  end

  it 'can have content' do
    comment = Comment.new
    comment_contents = "Johnny was a real bad student today."
    comment.content = comment_contents
    comment.save
    expect(comment.content).to eq(comment_contents)
  end

end
