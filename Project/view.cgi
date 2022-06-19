#!/usr/bin/python3
from wsgiref.handlers import CGIHandler
from flask import Flask
from flask import render_template, request
import psycopg2
import psycopg2.extras

## SGBD configs
DB_HOST="db.tecnico.ulisboa.pt"
DB_USER="ist195550"
DB_DATABASE=DB_USER
DB_PASSWORD="funky"
DB_CONNECTION_STRING = "host=%s dbname=%s user=%s password=%s" % (DB_HOST, DB_DATABASE, DB_USER, DB_PASSWORD)

app = Flask(__name__)


@app.route("/")
def list_replenishment_events():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        # Devemos pedir ao utilizador o número de série da IVM?
        query = "SELECT num_serie, fabricante, nome, unidades
                 FROM evento_reposicao NATURAL JOIN prateleira
                 GROUP BY num_serie, fabricante, nome;"
        cursor.execute(query)
        return render_template("index.html", cursor=cursor)
    except Exception as e:
        return str(e)  # Renders a page with the error.
    finally:
        cursor.close()
        dbConn.close()


@app.route("/balance")
def change_balance():
    try:
        return render_template("balance.html", params=request.args)
    except Exception as e:
        return str(e)


@app.route("/new_category", methods=["POST"])
def create_category():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        query = "INSERT INTO categoria VALUES (%s);"
        data = (name)
        cursor.execute(query, data)
        return query
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()

@app.route("/delete_category", methods=["DELETE"])
def delete_category():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        query = "DELETE FROM categoria WHERE name = %s;"
        data = (name)
        cursor.execute(query, data)
        return query
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()

# TODO
@app.route("/new_subcategory", methods=["POST"])
def create_category():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        query = "DELETE FROM categoria_simples WHERE name = %s;
                 INSERT INTO super_categoria VALUES (%s);
                 INSERT INTO categoria VALUES (%s)
                 INSERT INTO categoria VALUES (%s);
                 INSERT INTO tem_outra VALUES (%s, %s);"
        data = (super_name, super_name, super_name, super_name, name)
        cursor.execute(query, data)
        return query
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()

# TODO
@app.route("/delete_subcategory", methods=["DELETE"])
def delete_category():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        query = "DELETE FROM super_categoria WHERE name = %s;
                 INSERT INTO super_categoria VALUES (%s);"
                 INSERT INTO tem_outra VALUES (%s, %s);"
        data = (super_name, super_name, super_name, name)
        cursor.execute(query, data)
        return query
    except Exception as e:
        return str(e)
    finally:
        dbConn.commit()
        cursor.close()
        dbConn.close()

CGIHandler().run(app)
