require 'rails_helper'

describe Rating do
  let(:rating) {subject}

  it 'belongs to a student' do
    student = Student.create
    rating = Rating.create
    student.ratings << rating
    student.save
    expect(student.ratings).to include(rating)
  end

  it 'has discipline' do
    rating = Rating.new
    rating.discipline = 1
    rating.save
    expect(rating.discipline).to eq(1)
  end

  it 'has grit' do
    rating = Rating.new
    rating.grit = 1
    rating.save
    expect(rating.grit).to eq(1)
  end

  it 'has a gpa' do
    rating = Rating.new
    rating.gpa = 3.0
    rating.save
    expect(rating.gpa).to eq(3.0)
  end

  it 'has a learning style' do
    rating = Rating.new
    rating.learning_style = 'Kinesthetic'
    rating.save
    expect(rating.learning_style).to eq('Kinesthetic')
  end

  it 'has a subject' do
    rating = Rating.new
    rating.subject = 'Math'
    rating.save
    expect(rating.subject).to eq('Math')
  end
end
