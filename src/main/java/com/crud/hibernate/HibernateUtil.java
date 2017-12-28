package com.crud.hibernate;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Environment;

import com.crud.model.Note;

public class HibernateUtil {

	private static StandardServiceRegistry registry;
	private static SessionFactory sessionFactory;

	public static SessionFactory getSessionFactory() {
		if (sessionFactory == null) {
			try {
				StandardServiceRegistryBuilder registryBuilder = new StandardServiceRegistryBuilder();
				Map<String, String> settings = new HashMap<>();
				settings.put(Environment.DRIVER, "com.mysql.jdbc.Driver");
				settings.put(Environment.URL, "jdbc:mysql://localhost:3306/crud");
				settings.put(Environment.USER, "root");
				settings.put(Environment.PASS, "");
				settings.put(Environment.POOL_SIZE, "20");
				settings.put(Environment.AUTOCOMMIT, "true");
				settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");
				settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL5InnoDBDialect");
				settings.put(Environment.SHOW_SQL, "true");
				settings.put(Environment.HBM2DDL_AUTO, "update");

				registryBuilder.applySettings(settings);

				registry = registryBuilder.build();

				MetadataSources sources = new MetadataSources(registry).addAnnotatedClass(Note.class);

				Metadata metadata = sources.getMetadataBuilder().build();

				sessionFactory = metadata.getSessionFactoryBuilder().build();

			} catch (Exception e) {
				e.printStackTrace();
				if (registry != null) {
					StandardServiceRegistryBuilder.destroy(registry);
				}
			}
		}
		return sessionFactory;
	}

	public static void shutdown() {
		if (registry != null) {
			StandardServiceRegistryBuilder.destroy(registry);
		}
	}
}