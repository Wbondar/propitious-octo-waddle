package pl.lubcode.propitious_octo_waddle.propitious_octo_waddle_domain;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

public final class Option implements Identifiable<Option>, Describable {
	private final Identificator<Option> id;
	private final Description           description;
	private final Reward                reward;
	
	Option (Identificator<Option> id, Description description, Reward reward) {
		this.id = id;
		this.description = description;
		this.reward = reward;
	}
	
	@Override
	public final Identificator<Option> getId( ) {
		return this.id;
	}
	
	@Override
	public final Description getDescription ( ) {
		return this.description;
	}

	public Option update (Account updator, String updatedDescription, Integer updatedReward) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			boolean success = false;
			boolean updateDescription = false;
			boolean updateReward = false;
			if (updatedDescription != null && !updatedDescription.isEmpty( )) {
				updateDescription = true;
			}
			if (updatedReward != this.reward.intValue( )) {
				updateReward = true;
			}
			if (updateDescription && updateReward) {
				success = dao.execute("{CALL option_update(?, ?, ?, ?)}", this.id.longValue( ), updator.getId( ).longValue( ), updatedDescription, updatedReward);
				if (success) {
					return new Option (this.id, new PlainTextDescription (updatedDescription), new Reward(updatedReward));
				}
			} else {
				if (updateDescription) {
					success = dao.execute("{CALL option_update_description(?, ?, ?)}", this.id.longValue( ), updator.getId( ).longValue( ), updatedDescription);
					if (success) {
						return new Option (this.id, new PlainTextDescription (updatedDescription), this.reward);
					}
				}
				if (updateReward) {
					success = dao.execute("{CALL option_update_reward(?, ?, ?)}", this.id.longValue( ), updator.getId( ).longValue( ), updatedReward);
					if (success) {
						return new Option (this.id, this.description, new Reward(updatedReward));
					}
				}
			}
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to update option.", e);
		}
		return this;
	}

	public static Set<Option> getInstances(Identificator<Task> id) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			Collection<Data<Option>> datas = dao.<Option>retrieveAll("SELECT * FROM standard_options WHERE task_id = ?;", id.longValue( ));
			Set<Option> options = new HashSet<Option> ( );
			for (Data<Option> data : datas) {
				Description description = new PlainTextDescription (data.getString("description"));
				Reward reward = new Reward (data.getInteger("reward"));
				options.add(new Option (data.getId( ), description, reward));
			}
			return options;
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to retrieve options by task id.", e);
		}
	}

	public static Option newInstance (
		Account creator, 
		Task task,
		String description, 
		String rewardForNewOption
	) 
	{
		if (description == null || description.isEmpty( )) {
			return null;
		}
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			Short reward = 0;
			try
			{
				reward = Short.valueOf(rewardForNewOption);
			} catch (NumberFormatException e) {
				reward = 0;
			}
			Data<Option> data = dao.<Option>store("{CALL option_create (?, ?, ?, ?::SMALLINT)}", creator.getId( ).longValue( ), task.getId( ).longValue( ), description, reward);
			return new Option (data.getId( ), new PlainTextDescription (description), new Reward(reward));
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to retrieve options by task id.", e);
		}
	}

	public static Option getInstance(String id) {
		return getInstance(Identificator.<Option>valueOf(id));
	}

	private static Option getInstance(Identificator<Option> id) {
		try
		{
			DataAccessObject dao = DataAccessObject.getInstance( );
			Data<Option> data = dao.<Option>retrieve("SELECT * FROM standard_options WHERE id = ?;", id.longValue( ));
			Description description = new PlainTextDescription (data.getString("description"));
			Reward reward = new Reward (data.getInteger("reward"));
			return new Option (data.getId( ), description, reward);
		} catch (DataAccessObjectException e) {
			throw new RuntimeException ("Failed to retrieve option by id.", e);
		}
	}

	public boolean destroy(Account destroyer) {
		return false;
	}

	public Option updateDescription (Account updator, String updatedDescription) {
		return this.update(updator, updatedDescription, null);
	}

	public Option updateReward (Account updator, Integer updatedReward) {
		return this.update(updator, null, updatedReward);
	}
}
