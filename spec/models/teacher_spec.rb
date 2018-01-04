require 'rails_helper'

describe Teacher do
  let(:teacher) {subject}

  it 'has a username' do
    teacher = Teacher.new
    teacher.username = 'Gerald Danzby'
    teacher.save
    expect(teacher.username).to eq('Gerald Danzby')
  end

  it 'has many students through comments' do
    student = Student.new
    teacher.students << student
    teacher.save
    expect(teacher.students).to include(student)
  end

  it 'has many comments' do
    comment = Comment.create
    teacher.comments << comment
    teacher.save
    expect(comment.teacher).to eq(teacher)
  end
end
