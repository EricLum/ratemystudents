require 'rails_helper'

describe Student do
  let(:student) {subject}

  it 'has a name' do
    student = Student.new
    student.name = 'Gerald Danzby'
    student.save
    expect(student.name).to eq('Gerald Danzby')
  end

  it 'has many teachers through comments' do
    teacher = Teacher.new
    student = Student.new
    student.teachers << teacher
    student.save
    expect(student.teachers).to include(teacher)
  end
end
