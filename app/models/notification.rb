class Notification < ApplicationRecord
  belongs_to :student
  belongs_to :course
  belongs_to :lesson, optional: true

  scope :by_student, ->(student_id) { where(student_id: student_id) }
  scope :unread, -> { where(read: false) }

  def self.create_for_course(course)
    msg = "O professor #{course.teacher.name} criou o curso #{course.name}."
    course.teacher.followers.each do |student|
      Notification.create!(message: msg, student: student, course: course)
    end
  end

  def self.create_for_lesson(lesson)
    course = lesson.course
    msg = "O professor #{course.teacher.name} criou a aula #{lesson.title} "\
          "pro curso #{course.name}."
    course.teacher.followers.each do |student|
      Notification.create!(message: msg, student: student, course: course,
                           lesson: lesson)
    end
  end
end
