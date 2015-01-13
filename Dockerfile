# TODO: we need this to get Python 3 at least 3.4; remove when 21 becomes "the" fedora docker image
FROM fedora:21

WORKDIR /srv
RUN yum -y install python-virtualenv && virtualenv "artstyle"

ADD . /srv/artstyle/artstyle
RUN cd "artstyle" && source bin/activate && pip install -r "artstyle/requirements.txt"


EXPOSE 8000
CMD source /srv/artstyle/bin/activate && \
 /srv/artstyle/artstyle/manage.py runserver 0.0.0.0:8000
