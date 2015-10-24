package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

import java.util.Set;

public interface Instructor {
	Set<Task> getTasks ( );
	Set<Pool> getPools ( );
	Set<Exam> getExams ( );
}
